#!/bin/bash

file_in="$HOME/Videos/conv_queue"
file_out="$HOME/Videos/conv_out"

notify_start_conv() {
    notify-send "Video Conversion" "Conversion started..." $1
}

notify_success() {
    notify-send "Video Conversion" "Conversion completed"
}

notify_error() {
    notify-send "Video Conversion" $1
}

echo "----"
echo "Video Conversion"
echo "----"
echo "1) Convert to compatible video"
echo "2) Convert to final video"
echo "3) Exit"
echo "----"

read -p "Enter your choice: " choice

case $choice in
    1)
        input_codecs=("h264" "hevc")
        echo "----"
        echo "Converting to compatible video..."
        echo "----"
        echo "Select Codec for videos in queues"
        echo "----"
        echo "1) DNxHR HQ (Recommended for DaVinci - Best quality)"
        echo "2) DNxHR SQ (Smaller files, good quality)"
        echo "3) ProRes 422 (Mac-friendly, high quality)"
        echo "4) H.264 (Smaller but not ideal for editing)"
        echo "5) Exit"
        echo "----"

        read -p "Enter your choice: " codec_choice

        out_format="mov"
        case $codec_choice in
            1)
                video_enc="-c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p"
                ;;
            2)
                video_enc="-c:v dnxhd -profile:v dnxhr_sq -pix_fmt yuv422p"
                ;;
            3)
                video_enc="-c:v prores_ks -profile:v 2 -pix_fmt yuv422p10le"
                ;;
            4)
                video_enc="-c:v libx264 -preset medium -crf 18 -pix_fmt yuv420p"
                ;;
            5)
                exit 0
                ;;
            *)
                echo "Invalid choice try again"
                ;;
        esac

        ;;
    2)
        echo "Converting to final video..."
        input_codecs=("dnxhd" "prores" "h264")

        echo "----"
        echo "Select Final Export Codec"
        echo "----"
        echo "1) H.264 (Universal compatibility)"
        echo "2) H.265/HEVC (Smaller files, modern)"
        echo "3) AV1 (Smallest files, future-proof)"
        echo "4) Exit"
        echo "----"

        read -p "Enter your choice: " codec_choice

        out_format="mp4"
        case $codec_choice in
            1)
                video_enc="-c:v libx264 -preset slow -crf 23 -pix_fmt yuv420p -x264-params opencl=true -movflags +faststart"
                ;;
            2)
                video_enc="-c:v libx265 -preset slow -crf 23 -pix_fmt yuv420p -movflags +faststart"
                ;;
            3)
                video_enc="-c:v libsvtav1 -preset 3 -crf 23 -pix_fmt yuv420p -movflags +faststart"
                ;;
            4)
                exit 0
                ;;
            *)
                echo "Invalid choice try again"
                ;;
        esac

        ;;
    3)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice"
        ;;
esac

if ! command -v ffmpeg &> /dev/null; then
    notify_error "ffmpeg is not installed. Please install it before proceeding."
    exit 1
fi

mkdir -p "$file_in"
mkdir -p "$file_out"

if [[ -z $file_in ]]; then
    notify_error "No input file specified."
    exit 1
fi

file_idx=0

for file in "$file_in"/*; do
    [[ -f "$file" ]] || continue
    file_name=$(basename "$file")
    container_format=$(ffprobe -v error -show_entries format=format_name -of default=nw=1:nk=1 "$file")
    video_codec=$(ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=nw=1:nk=1 "$file")
    audio_codec=$(ffprobe -v error -select_streams a:0 -show_entries stream=codec_name -of default=nw=1:nk=1 "$file")
    frame_rate=$(ffprobe -v error -select_streams v:0 -show_entries stream=r_frame_rate -of default=nw=1:nk=1 "$file")

    # Build video encoding options for this file
    current_video_enc="$video_enc"

    # For choice 1 (compatible video), calculate keyframe interval from frame rate
    if [[ $choice -eq 1 && -n "$frame_rate" ]]; then
        fps=$(echo "$frame_rate" | awk -F'/' '{if($2) print $1/$2; else print $1}' | cut -d'.' -f1)
        if [[ -n "$fps" && "$fps" -gt 0 ]]; then
            keyframe_interval=$((fps * 2))  # 2 second GOP
            current_video_enc="$current_video_enc -g $keyframe_interval"
        fi
    fi

    case $container_format in
        *mov*|*mp4*|*quicktime*) file_ext="mov";;
        "")
            echo "Warning: Unsupported container format for file '$file_name'."
            continue
            ;;
        *)
            echo "Warning: Unsupported container format '$container_format' for file '$file_name'."
            continue
            ;;
    esac

    # Map all decodable audio streams
    # Using -map 0:a:0 to map only the first audio stream (stereo AAC)
    # Second stream is often spatial audio with unknown codec that can't be decoded
    if [[ $audio_codec == "aac" ]]; then
        audio_enc="-map 0:v:0 -map 0:a:0 -c:a pcm_s16le"
    else
        audio_enc="-map 0:v:0 -map 0:a:0 -c:a copy"
    fi

    # Check if video codec is in the input_codecs array
    codec_found=0
    for codec in "${input_codecs[@]}"; do
        if [[ "$video_codec" == "$codec" ]]; then
            codec_found=1
            break
        fi
    done

    if [[ $codec_found -eq 1 ]]; then
        file_idx=$((file_idx + 1))
        notify_start_conv "$file_name"
        output_file="$file_out/${file_name%.*}.$out_format"
        echo "Converting: $file_name -> ${file_name%.*}.$out_format"
        ffmpeg -i "$file" $current_video_enc $audio_enc "$output_file" -y
    fi

done

notify_success

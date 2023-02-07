series_name=$1
cd ~/code/stable-diffusion-webui

if [ -z "$series_name" ]
then
    cp ~/code/ImGen/ui-configs/default-ui-config.json ./ui-config.json
    cp ~/code/ImGen/configs/default-config.json ./config.json
else
    cp ~/code/ImGen/ui-configs/ui-config-$series_name.json ./ui-config.json
    cp ~/code/ImGen/configs/config-$series_name.json ./config.json
fi

now_str=$(date +'%Y%m%d_%H%M%S')
mkdir $STORAGE_ROOT/ImGen/outputs/output_$now_str
unlink outputs
ln -s $STORAGE_ROOT/ImGen/outputs/output_$now_str ./outputs

COMMANDLINE_ARGS="--deepdanbooru --share --gradio-debug --gradio-auth AyatsujiT:Wzf19970822" REQS_FILE="requirements.txt" python launch.py

cd ~/code/ImGen

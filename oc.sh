#0, GPU-71a6b808-d79e-0668-00bc-ce3e8154e3b2, NVIDIA TITAN V, 22.51, 34, 135, 850, 28
#1, GPU-019aa414-c6ea-8aa0-c2f5-438c88a46efc, NVIDIA GeForce RTX 2080 Ti, 0.96, 24, 300, 405, 29
#2, GPU-28e32c0f-1d5c-bd42-86c4-396e3f1b33e5, NVIDIA RTX A5000, 3.58, 23, 0, 405, 30
#3, GPU-46421260-2c30-dbbd-edfe-dcf4d4ce7526, NVIDIA GeForce RTX 3090, 17.17, 24, 0, 405, 0
#4, GPU-e2f58873-3681-03fb-df69-06e357df6468, NVIDIA RTX A5000, 4.00, 22, 0, 405, 30
#5, GPU-f8424c92-2133-e2cf-fcd4-b4fb8ba3e025, NVIDIA GeForce RTX 2080 Ti, 7.23, 23, 300, 405, 30


sudo nvidia-smi -i 0,1,2,3,4,5,6 -pm 1

#RTX2080Ti
sudo nvidia-smi -i 5 -pl 140
sudo nvidia-smi -i 1 -pl 140
sudo DISPLAY=:0 XAUTHORITY=/run/user/125/gdm/Xauthority nvidia-settings -a [gpu:1]/GPUGraphicsClockOffsetAllPerformanceLevels=-200 -a [gpu:1]/GPUMemoryTransferRateOffsetAllPerformanceLevels=2200
sudo DISPLAY=:0 XAUTHORITY=/run/user/125/gdm/Xauthority nvidia-settings -a [gpu:5]/GPUGraphicsClockOffsetAllPerformanceLevels=-200 -a [gpu:5]/GPUMemoryTransferRateOffsetAllPerformanceLevels=2000


#3090
sudo nvidia-smi -i 3 -pl 305
sudo DISPLAY=:0 XAUTHORITY=/run/user/125/gdm/Xauthority nvidia-settings -a [gpu:3]/GPUGraphicsClockOffsetAllPerformanceLevels=0 -a [gpu:3]/GPUMemoryTransferRateOffsetAllPerformanceLevels=2400

#A5000
sudo nvidia-smi -i 2 -pl 230
sudo DISPLAY=:0 XAUTHORITY=/run/user/125/gdm/Xauthority nvidia-settings -a [gpu:2]/GPUGraphicsClockOffsetAllPerformanceLevels=-200 -a [gpu:2]/GPUMemoryTransferRateOffsetAllPerformanceLevels=2600
sudo DISPLAY=:0 XAUTHORITY=/run/user/125/gdm/Xauthority nvidia-settings -a '[gpu:2]/GPUFanControlState=1'
sudo DISPLAY=:0 XAUTHORITY=/run/user/125/gdm/Xauthority nvidia-settings -a '[fan:2]/GPUTargetFanSpeed=60'
sudo nvidia-smi -i 4 -pl 230
sudo DISPLAY=:0 XAUTHORITY=/run/user/125/gdm/Xauthority nvidia-settings -a [gpu:4]/GPUGraphicsClockOffsetAllPerformanceLevels=-200 -a [gpu:4]/GPUMemoryTransferRateOffsetAllPerformanceLevels=2600
sudo DISPLAY=:0 XAUTHORITY=/run/user/125/gdm/Xauthority nvidia-settings -a '[gpu:4]/GPUFanControlState=0'
#sudo DISPLAY=:0 XAUTHORITY=/run/user/125/gdm/Xauthority nvidia-settings -a '[gpu:4]/GPUFanControlState=1'
#sudo DISPLAY=:0 XAUTHORITY=/run/user/125/gdm/Xauthority nvidia-settings -a '[fan:4]/GPUTargetFanSpeed=60'

#Titan V
sudo nvidia-smi -i 0 -ac 850,997
#sudo nvidia-smi -i 2 -ac 5705,1556
#  sudo nvidia-smi -i 0,1 -pl 130
sudo nvidia-smi -i 3 -pl 280
#sudo nvidia-smi  -i 2 -ac 8001,900
#sudo nvidia-smi -i 2 -pl 125


for i in `nvidia-smi -L`
do
  if `echo $i|grep "TITAN Xp" `
  then
	  echo "XP "$i
  else
	  echo "V "$i
  fi
done

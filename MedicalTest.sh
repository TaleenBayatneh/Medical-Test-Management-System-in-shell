#!/bin/sh
option=0
op=0
touch medicalRecord.txt
touch medicalTest.txt
# medical test file content
echo "Name: Hemoglobin (Hgb); Range: > 13.8, < 17.2; Unit: g/dL \nName: Blood Glucose Test (BGT); Range: > 70, < 99; Unit: mg/dL \nName: LDL Cholesterol Low-Density Lipoprotein (LDL); Range: < 100; Unit: mg/dL \nName: Systolic Blood Pressure (systole); Range: < 120; Unit: mm Hg \nName: Diastolic Blood Pressure (diastole); Range: < 80; Unit: mm Hg" > medicalTest.txt

# displying the menu
while [ $option -ne 7 ]
do
   echo "============================================"
   echo "Welcome to our Medical Test Management System"
   echo "1- Add new medical test record"
   echo "2- Search for a test by patient ID"
   echo "3- Search for up normal tests"
   echo "4- Average test value"
   echo "5- Update an existing test result"
   echo "6- Delete an existing test record"
   echo "7- Exit "
   echo " "
   echo "Enter one of these options:"
   read option

# to check if the entered option is valid (1-7)
   while [ $option -gt 7 -o $option -lt 1 ]
   do
    echo "!! Invalid entery, please enter one of the shown options: "
    read option
   done
echo "========================================="

case "$option" in
#first option in menu that add a new test record
################################################################################
1) echo "Enter the new test record information: "
#ask the user to enter patient id
   echo "please enter patient ID:"
   read patient_id
#check if the id is valid(7-digits)
  while :
   do
     if echo "$patient_id" | grep "[^0-9]"
      then
         e=1
     else
         e=0
     fi

     if [ "$e" -eq 1 ]
     then
         echo "!! Invalid id entery please enter valid id only integers:"
         read patient_id
         continue
     fi
     if [ "$e" -eq 0 ]
     then
       	 c_c=$(echo -n "$patient_id" | wc -c)
         if [ "$c_c" -ne 7 ]
   	 then
            echo "!! Invalid id enter id only 7 integers"
            read patient_id
         else
            break
         fi
     fi
     done
#ask the user to enter test name
   echo "please enter test name:"
   read test_name
#check if test name is valid
   while :
   do
     if [ "$test_name" != "Hgb" ] && [ "$test_name" != "BGT" ] && [ "$test_name" != "LDL" ] && [ "$test_name" != "systole" ] && [ "$test_name" != "diastole" ]
     then
         echo "!! Invalid test name, please enter valid name:"
         read test_name
         continue
     else
         break
     fi
   done
#ask the user to enter test date (YYYY-MM)
   echo "please enter test date in this form (YYYY-MM):"
   read test_date
   year=$(echo "$test_date" | cut -d"-" -f1)
   month=$(echo "$test_date" | cut -d"-" -f2)
#to remove the white spaces we used xargs
   year=$(echo "$year" | xargs)
   month=$(echo "$month" | xargs)
#check if the date is valid
   while :
   do
    if [ "$year" -gt "2024" ] || [ "$month" -lt "01" ] || [ "$month" -gt "12" ]
    then
	#ask the user to enter a valid date
       echo "Please enter a valid date:"
        read test_date
        year=$(echo "$test_date" | cut -d"-" -f1)
        month=$(echo "$test_date" | cut -d"-" -f2)

        year=$(echo "$year" | xargs)
        month=$(echo "$month" | xargs)
        continue
    else
        break
    fi
   done
#ask the user to enter the test result
   echo "please enter test result:"
   read test_result
#check if the result is valid(float)
   while :
   do
     if echo "$test_result" | grep "[A-Za-z]"
     then
         e=1
     else
         e=0
     fi

     if [ "$e" -eq 1 ]
     then
         echo "!! Invalid result enter, please enter valid result anly numbers:"
         read test_result
         continue
     fi
     if [ "$e" -eq 0 ]
     then
       break
     fi
     done
#ask the user to enter the unit
   echo "please enter test unit: "
   read test_unit
   test_unit=$(echo "$test_unit" | xargs)
   test_name=$(echo "$test_name" | xargs)
#check if the unit match the test unit
   while :
   do
    if [ "$test_name" = "Hgb" ] && [ "$test_unit" != "g/dL" ]
    then
    echo "Wrong test unit for Hgb test please enter the correct unit:"
    echo "--"
    elif [ "$test_name" = "BGT" ] && [ "$test_unit" != "mg/dL" ]
    then
    echo "Wrong test unit for BGT test please enter the correct unit:"
    echo "--"
    elif [ "$test_name" = "LDL" ] && [ "$test_unit" != "mg/dL" ]
    then
    echo "Wrong test unit for LDL test please enter the correct unit:"
    echo "--"
    elif [ "$test_name" = "systole" ] && [ "$test_unit" != "mm Hg" ]
    then
    echo "Wrong test unit for systole test please enter the correct unit:"
    echo "--"
    elif [ "$test_name" = "diastole" ] && [ "$test_unit" != "mm Hg" ]
    then
    echo "Wrong test unit for diastole test please enter the correct unit:"
    echo "--"
    else
         break
    fi
   read test_unit
   test_unit=$(echo "$test_unit" | xargs)
   done

#ask the user to enter the status
   echo "please enter the status:"
   read status
#check if the status is valid
   while :
   do
     if [ "$status" != "completed" ] && [ "$status" != "pending" ]
     then
        echo "The status you entered is not valid!!"
        echo "Please enter a valid status:"
        read status
        continue
     else
         break
     fi
   done
#adding the record to medicalRecord
   printf "%d: %s, %s, %0.2f, %s, %s \n" "$patient_id" "$test_name" "$test_date" "$test_result" "$test_unit" "$status" >> medicalRecord.txt
   echo " "
   echo "This new test recored has been added successfuly"
   echo " "
   ;;


#second option that Search for a test
############################################################################
2) echo "Enter patient ID to search: "
   read patient_id
#check if the patient_id is valid(7-digits)
  while :
   do
     if echo "$patient_id" | grep "[^0-9]"
      then
         e=1
     else
         e=0
     fi

     if [ "$e" -eq 1 ]
     then
         echo "!! Invalid id entery please enter valid id only integers:"
         read patient_id
         continue
     fi
     if [ "$e" -eq 1 ]
     then
         echo "!! Invalid id entery please enter valid id only integers:"
         read patient_id
         continue
     fi
     if [ "$e" -eq 0 ]
     then
         c_c=$(echo -n "$patient_id" | wc -c)
         if [ "$c_c" -ne 7 ]
         then
            echo "!! Invalid id enter id only 7 integers"
            read patient_id
         else
            break
         fi
     fi
     done

#count the number of lines in medicalRecord file
   lines=$( wc -l < medicalRecord.txt )

   c=1
   f=0
   while [ "$c" -le "$lines" ]
   do
     id=$(cut -d":" -f1 < medicalRecord.txt | sed -n "${c}p")

     if [ "$id" -eq "$patient_id" ]
     then
      f=$(( f + 1 ))
     fi
     c=$((c + 1))
   done

   if [ "$f" -eq 0 ]
   then
       echo "!!Patient with this id is not found"
       echo " "
       continue
   fi
   # if we reach here means we found the id
   echo "The patient you are searching for is found"
   ####
#secound menu
   while [ $op -ne 5 ]
   do
   echo " "
   echo "Enter one of these options:"
   echo "1- Retrieve all patient tests"
   echo "2- Retrieve all up normanl patient tests"
   echo "3- Retrieve all patient tests in a given specific preiod"
   echo "4- Retrieve all patient tests based on test status"
   echo "5- Exit"
   read op
# to check that the entered option is valid (1-5)
   while [ $op -gt 5 -o $op -lt 1 ]
   do
    echo "!! Invalid entery, please enter one of the shown options: "
    read op
   done
echo "========================================="
   case "$op"
   in
#display all the patient tests
   1)
    echo "All patient tests:"

    line=$( wc -l < medicalRecord.txt )

    count=1
    found=0
    while [ "$count" -le "$line" ]
    do
      id=$(cut -d":" -f1 < medicalRecord.txt | sed -n "${count}p")

      if [ "$id" -eq "$patient_id" ]
      then
        echo " "
        #print the line for the entered patient id
        sed -n "${count}p" medicalRecord.txt
        echo " "
        found=$(( found + 1 ))
      fi
      count=$((count + 1))
     done
   ;;

#diplay up normal tests in the file
   2)
    echo "Up normal tests:"
   lines=$( wc -l < medicalRecord.txt )
   c=1
   f=0
#create a file for patient id
   touch p_id.txt
   while [ "$c" -le "$lines" ]
    do
      id=$(cut -d":" -f1 < medicalRecord.txt | sed -n "${c}p")

      if [ "$id" -eq "$patient_id" ]
      then
        sed -n "${c}p" medicalRecord.txt >> p_id.txt
      fi
      c=$((c + 1))
   done
#count the number of lines in medicalRecord file
   lines1=$( wc -l < medicalTest.txt )
   c1=1
   lines2=$( wc -l < p_id.txt )
   c2=1

   while [ "$c2" -le "$lines2" ]
   do
#Store the result of the cut command for the name test in n
    n=$(cut -d"," -f1 < p_id.txt | cut -d":" -f2  | sed -n "${c2}p")
##Store the result of the cut command for the result in r
    r=$(cut -d" " -f4 < p_id.txt | cut -d"," -f1  | sed -n "${c2}p")

# medical test
      while [ "$c1" -le "$lines1" ]
      do
#store the name of the test from medical test file
        n2=$(cut -d"(" -f2 < medicalTest.txt | cut -d")" -f1  | sed -n "${c1}p")
#store the upper value for each test
        r_u=$(cut -d"<" -f2 < medicalTest.txt | cut -d";" -f1  | sed -n "${c1}p")

        n2=$(echo "$n2" | xargs)
#check if the test is Hgp or BGT so it has a lowe case we should take
        if [ "$n2" = "Hgb" -o  "$n2" = "BGT" ]
        then
#store the lower value
        r_l=$(cut -d">" -f2 < medicalTest.txt | cut -d"," -f1  | sed -n "${c1}p")

        fi
#for white space
      n=$(echo "$n" | xargs)
      r=$(echo "$r" | xargs)
      r_u=$(echo "$r_u" | xargs)
      r_l=$(echo "$r_l" | xargs)

      if [ "$n" = "$n2" ]
       then
           if [ "$n" = "Hgb" ] || [ "$n" = "BGT" ]
           then
               if [ "$(echo "$r > $r_u" | bc)" -eq 1 ] || [ "$(echo "$r < $r_l" | bc)" -eq 1 ]
               then
                  head -n $c2 p_id.txt | tail -n 1
               fi
           else
               if [ "$(echo "$r > $r_u" | bc)" -eq 1 ]
               then
                  head -n $c2 p_id.txt | tail -n 1
               fi

           fi
     fi
       c1=$((c1 + 1))
       done
       c1=1
      c2=$((c2 + 1))
   done
#remove p_id.txt file
   rm p_id.txt
   ;;

   3)
#ask user to enter a specific period to print the patient tests in that period
    echo "Enter starting year date in YYYY form: "
    read s_year
    while :
    do
      if [ "$s_year" -gt 2024 ]
      then
          echo "!! Enter a valid year:"
          read s_year
      else
          break
      fi
    done

    echo "Enter starting month date in MM form: "
    read s_month
    while :
    do
      if [ "$s_month" -gt 12 ] || [ "$s_month" -lt 01 ]
      then
          echo "!! Enter a valid month:"
          read s_month
      else
          break
      fi
    done

    echo "Enter emdiing year date in YYYY form: "
    read e_year
    while :
    do
      if [ "$e_year" -gt 2024 ]
      then
          echo "!! Enter a valid year:"
          read e_year
      else
          break
      fi
    done

    echo "Enter starting month date in MM form: "
    read e_month
    while :
    do
      if [ "$e_month" -gt 12 ] || [ "$e_month" -lt 01 ]
      then
          echo "!! Enter a valid month:"
          read e_month
      else
          break
      fi
    done

    echo " "
   lines=$( wc -l < medicalRecord.txt )
   c=1
   touch p_id.txt
   while [ "$c" -le "$lines" ]
    do
      id=$(cut -d":" -f1 < medicalRecord.txt | sed -n "${c}p")

      if [ "$id" -eq "$patient_id" ]
      then
        sed -n "${c}p" medicalRecord.txt >> p_id.txt
      fi
      c=$((c + 1))
     done

    line=$( wc -l < p_id.txt )

    count=1
    while [ "$count" -le "$line" ]
    do
      y=$(cut -d"," -f2 < p_id.txt | cut -d"-" -f1 | sed -n "${count}p")
      m=$(cut -d"-" -f2 < p_id.txt | cut -d"," -f1 | sed -n "${count}p")
      y=$(echo "$y" | xargs)
      m=$(echo "$m" | xargs)

      if [ "$y" -gt "$s_year" ] && [ "$y" -lt "$e_year" ]
      then
            head -n $count p_id.txt | tail -n 1
            echo " "
      fi
      if [ "$y" -eq "$s_year" ] && [ "$m" -gt "$s_month" ]
      then
              head -n $count p_id.txt | tail -n 1
              echo " "
      elif [ "$y" -eq "$e_year" ] && [ "$m" -lt "$e_month" ]
      then
              head -n $count p_id.txt | tail -n 1
              echo " "
      fi

      count=$((count + 1))
     done
     rm p_id.txt
   ;;

   4)
#ask the user to enter the test status
    echo "Enter tests status:"
    read status

    while :
    do
#check if the status is valid
      if [ "$status" != "completed" ] && [ "$status" != "pending" ]
      then
         echo "The status you entered id not valid!!"
         echo "Please enter a valid status:"
         read status
         continue
      else
          break
      fi
    done

   lines=$( wc -l < medicalRecord.txt )
   c=1
   f=0
   touch p_id.txt
   while [ "$c" -le "$lines" ]
    do
      id=$(cut -d":" -f1 < medicalRecord.txt | sed -n "${c}p")

      if [ "$id" -eq "$patient_id" ]
      then
        sed -n "${c}p" medicalRecord.txt >> p_id.txt
      fi
      c=$((c + 1))
     done
   lines2=$( wc -l < p_id.txt )
   c2=1
   while [ "$c2" -le "$lines2" ]
    do
      s=$(cut -d"," -f5 < p_id.txt | sed -n "${c2}p")
      s=$(echo "$s" | xargs)
      if [ "$s" = "$status" ]
      then
          head -n $c2 p_id.txt | tail -n 1
      fi
      c2=$((c2 + 1))
     done
     rm p_id.txt
   ;;
   esac
 done
;;

#######################################################################################################################
3)
#print all up normal tests in the file
   echo "All up normal tests are: "
   lines=$( wc -l < medicalRecord.txt )
   counter=1
   f=0
   lines2=$( wc -l < medicalTest.txt )
   c2=1
   f2=0
# medical record
   while [ "$counter" -le "$lines" ]
   do
     #test name from the record file
     n=$(cut -d"," -f1 < medicalRecord.txt | cut -d":" -f2  | sed -n "${counter}p")
     #result from record file
     r=$(cut -d" " -f4 < medicalRecord.txt | cut -d"," -f1  | sed -n "${counter}p")

# medical test
      while [ "$c2" -le "$lines2" ]
      do
        #test name from mecical test file
        n2=$(cut -d"(" -f2 < medicalTest.txt | cut -d")" -f1  | sed -n "${c2}p")
         #upper value
        r_u=$(cut -d"<" -f2 < medicalTest.txt | cut -d";" -f1  | sed -n "${c2}p")

        n2=$(echo "$n2" | xargs)
        #if the name is Hgp or BGT so it has a lower value
        if [ "$n2" = "Hgb" -o  "$n2" = "BGT" ]
        then
        #lower value
        r_l=$(cut -d">" -f2 < medicalTest.txt | cut -d"," -f1  | sed -n "${c2}p")

        fi

      n=$(echo "$n" | xargs)
      r=$(echo "$r" | xargs)
      r_u=$(echo "$r_u" | xargs)
      r_l=$(echo "$r_l" | xargs)

      if [ "$n" = "$n2" ]
       then
           if [ "$n" = "Hgb" ] || [ "$n" = "BGT" ]
           then
               if [ "$(echo "$r > $r_u" | bc)" -eq 1 ] || [ "$(echo "$r < $r_l" | bc)" -eq 1 ]
               then
                  head -n $counter medicalRecord.txt | tail -n 1
               fi
           else
               if [ "$(echo "$r > $r_u" | bc)" -eq 1 ]
               then
                  head -n $counter medicalRecord.txt | tail -n 1
               fi
           fi
     fi
       c2=$((c2 + 1))
       done
       c2=1
    counter=$((counter + 1))
   done

   ;;
#average test value
############################################################################
4) echo "Average tests value: "
   sum_Hgb=0
   c_Hgb=0
   sum_BGT=0
   c_BGT=0
   sum_LDL=0
   c_LDL=0
   sum_systole=0
   c_systole=0
   sum_diastole=0
   c_diastole=0

   lines=$( wc -l < medicalRecord.txt )
   c=1
#  medical record
   while [ "$c" -le "$lines" ]
   do
     name=$(cut -d"," -f1 < medicalRecord.txt | cut -d":" -f2  | sed -n "${c}p")

     result=$(cut -d" " -f4 < medicalRecord.txt | cut -d"," -f1  | sed -n "${c}p")

      name=$(echo "$name" | xargs)
      result=$(echo "$result" | xargs)

     if [ "$name" = "Hgb" ]
     then
         sum_Hgb=$(echo "$sum_Hgb + $result" | bc)
         c_Hgb=$((c_Hgb + 1))
     fi

     if [ "$name" = "BGT" ]
     then
         sum_BGT=$(echo "$sum_BGT + $result" | bc)
         c_BGT=$((c_BGT + 1))
     fi

     if [ "$name" = "LDL" ]
     then
         sum_LDL=$(echo "$sum_LDL + $result" | bc)
         c_LDL=$((c_LDL + 1))
     fi

     if [ "$name" = "systole" ]
     then
         sum_systole=$(echo "$sum_systole + $result" | bc)
         c_systole=$((c_systole + 1))
     fi

     if [ "$name" = "diastole" ]
     then
         sum_diastole=$(echo "$sum_diastole + $result" | bc)
         c_diastole=$((c_diastole + 1))
     fi

 c=$((c + 1))
done

    if [ "$c_Hgb" -ne 0 ]
    then
     avg_Hgb=$(echo "$sum_Hgb / $c_Hgb" | bc -l)
     printf "Average for Hgb tests: %.2f\n" "$avg_Hgb"
    else
     echo "There is no recoreds under \"Hgb\" test name"
    fi

    if [ "$c_BGT" -ne 0 ]
    then
     avg_BGT=$(echo "$sum_BGT / $c_BGT" | bc -l)
     printf "Average for BGT tests: %.2f\n" "$avg_BGT"
    else
     echo "There is no recoreds under \"BGT\" test name"
    fi

    if [ "$c_LDL" -ne 0 ]
    then
     avg_LDL=$(echo "$sum_LDL / $c_LDL" | bc -l)
     printf "Average for LDL tests: %.2f\n" "$avg_LDL"
    else
     echo "There is no recoreds under \"LDL\" test name"
    fi

    if [ "$c_systole" -ne 0 ]
    then
     avg_systole=$(echo "$sum_systole / $c_systole" | bc -l)
     printf "Average for systolic tests: %.2f\n" "$avg_systole"
    else
     echo "There is no recoreds under \"systole\" test name"
    fi

    if [ "$c_diastole" -ne 0 ]
     then
     avg_diastole=$(echo "$sum_diastole / $c_diastole" | bc -l)
     printf "Average for diastole tests: %.2f\n" "$avg_diastole"
    else
     echo "There is no recoreds under \"diastole\" test name"
    fi
   ;;
#update
#######################################################################
5) echo "Enter record number from this list you want to update: "
   cat -n  medicalRecord.txt
   echo "Enter here:"
#read the line number from the list
   read r_n
   lines=$( wc -l < medicalRecord.txt )
   while :
   do
#check if the line number is valid
     if [ "$r_n" -lt "1" ] || [ "$r_n" -gt "$lines" ]
     then
        echo "Please enter one of the shown numbers:"
        read r_n
     else
        break
     fi
   done
#ask the user to enter the new result 
   echo "Enter new reault:"
   read new_result

   old_result=$(cut -d"," -f3 < medicalRecord.txt | cut -d"," -f1  | sed -n "${r_n}p")
   old_result=$(echo "$old_result" | xargs)
#take the old result and replace it by the new one
   sed -i "${r_n}s/$old_result/$new_result/" medicalRecord.txt
   echo "This record has been updated:"
   sed -n "${r_n}p" medicalRecord.txt
   ;;
#delete
############################################################################
6) echo "Enter record number from this list you want to delete: "
   cat -n  medicalRecord.txt
   echo "Enter here:"
#read the line number from the list
   read r_n
   lines=$( wc -l < medicalRecord.txt )
   while :
   do
#check if the line number is valid
     if [ "$r_n" -lt "1" ] || [ "$r_n" -gt "$lines" ]
     then
        echo "Please enter one of the shown numbers:"
        read r_n
     else
        break
     fi
   done
#delet the record
   sed -i "${r_n}d" medicalRecord.txt

   echo "This recored has been deleted"
   cat medicalRecord.txt

  ;;

esac

done

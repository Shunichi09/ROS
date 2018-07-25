function [obs_s_set, obs_f_set, obs_num] = detect_obs(distance, angle)

%���̌��o�p�����[�^
distance_num = length(distance);%�f�[�^�̐�
%1m�ȓ����l������
basic_dis = 1 * ones(1, distance_num);
%���o�T�C�Y
obs_size  = 0.15;
margin = 0.5;%�덷
%���o臒l�i����𒴂��Ă���Ȃ񂩂���j
dis_dif = 0.3;

%basic�Ƃ̍�������
dif = basic_dis - distance;

%�L�^�p
j = 1;

%����
obs_flag = false;

%�傫���Ȃ����Ƃ�����L�^
for i = 30 : 1: distance_num-30
    if dif(i) < 0
       dif(i) = 0;        
    end
    
    if abs(dif(i)) > dis_dif
        obs_flag = true;
        start_p = i;
    end
    
    if obs_flag == true
        if abs(dif(i)) < dis_dif
            obs_flag = false;
            fin_p = i-1;
            %�J�n�_�ƏI���_�̈ʒu
            D_x_st = distance(start_p) * cos(angle(start_p));
            D_y_st = distance(start_p) * sin(angle(start_p));
            D_x_en = distance(fin_p) * cos(angle(fin_p));
            D_y_en = distance(fin_p) * sin(angle(fin_p));
            
            %���̂̑傫������
            obs_temp_size = sqrt((D_x_st - D_x_en)^2+(D_y_st - D_y_en)^2);
            %�_���ʂ�̑傫����������J�E���g
            if obs_temp_size < obs_size + margin && obs_temp_size > obs_size - margin
                obs_s_set(j, :) = [D_x_st, D_y_st];
                obs_f_set(j, :) = [D_x_en, D_y_en];
                j = j + 1;
             end
        end
    end
end

obs_num = j -1;
if obs_num == 0
    obs_s_set = 0;
    obs_f_set = 0;
end


%% Laser_func
function control_func(obj, message, src);

%% global�ϐ�(Publish�m�[�h�j
global matlab_pub_node

%% massage����M
distance = ((message.Ranges)');%�����f�[�^�i�j
distance_num = length(distance);%�f�[�^�̐�
Max_angle = message.AngleMax;%�ő�p�x
min_angle = message.AngleMin;%�ŏ��p�x
angle_step = message.AngleIncrement;%�X�e�b�v�p�x
angle = min_angle: angle_step :Max_angle;%�p�x�s��

%Laser�̃X�y�b�N
max_det_dis = 25;

%�O��l�����i�l���Ƃꂸ��35�ƂȂ����ꍇ�j
for n = 1:1:distance_num
    if distance(n) > max_det_dis && n > 1%�[�ȊO�̊O��l��1�O�̊p�x�̋����Ɠ��l
        distance(n) = distance(n-1);        
    elseif n == 1 && distance(n) > max_det_dis%�[��0��
        distance(n) = 0;
    end
end

%% �������牺�ɏ����������Ă������� %%%%%%%%%%%%%%
%distance�͋����f�[�^�s��
%angle�͊p�x�s��




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% �`��
refresh%���Z�b�g
 
for n_all = 1:1:distance_num
    X_all_Data(n_all) = distance(n_all) * cos(angle(n_all));
    Y_all_Data(n_all) = distance(n_all) * sin(angle(n_all));
end

plot(X_all_Data, Y_all_Data, 'LineWidth', 3, 'Color', [0 0 1]);
hold on
%�`��͈�
XLIM = max(X_all_Data);
YLIM = max(Y_all_Data);
xlim([-XLIM XLIM]);
ylim([-YLIM YLIM]);
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% message���M����ꍇ�����I
command = rosmessage(matlab_pub_node);

send(matlab_pub_node, command);


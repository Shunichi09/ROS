%% ���������
clear
close all
%ROS������
%raspi��IP����́i�ύX����ꍇ�j
rosinit('http://192.168.1.145:11311')

%% �e�m�[�h�����グ
% Publisher Global �錾
global matlab_pub_node

% Publisher
% Topic : /cmd_vel
% Topic Type : geometry_msgs/Twist

matlab_pub_node = rospublisher('/cmd_vel', 'geometry_msgs/Twist');

% Subscriber
% Topic : /Scan
% Topic Type : Matlab��Subscribe����ꍇ��Topic���݂̂Ŏ�M�\
% Callback_func : laser_func
% Topic����M������@laser_func�����s�i���t�H���_���ɂ���܂��j

matlab_sub_node = rossubscriber('/scan', @laser_func);%���[�U�̒l���擾���Ă���Subscriber

%% �܂���receive�ł��l�𓾂邱�Ƃ��\

%% �Еt��
%rosshutdown
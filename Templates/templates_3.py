#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rospy
# メッセージの型等のimport
from geometry_msgs.msg import Pose2D

class Publishsers():
    def __init__(self):
        # Publisherを作成
        self.publisher = rospy.Publisher('/topic_name', Pose2D, queue_size=10)

        # messageの型を作成
        self.message = Pose2D()
  
    def make_msg(self):
        # 処理を書く

    def send_msg(self):
        # messageを送信
        self.make_msg()
        self.publisher.publish(self.message)

class Subscribers():
    def __init__(self):
        # Subscriberを作成
        self.subscriber = rospy.Subscriber('/topic_name', Pose2D, self.callback)
            # messageの型を作成
        self.message = Pose2D()
      
    def callback(self, message):
        # callback時の処理(sendが必要な場合はここにsendを入れるやるのもあり)

def main():
    # nodeの立ち上げ
    rospy.init_node('Node_name')

    # クラスの作成
    pub = Publishsers()
    sub = Subscribers()

    # spin
    rospy.spin()

    # ratesleep
    rate = rospy.Rate(40)

    while not rospy.is_shutdown():
        pub.send_msg()
        rate.sleep()

if __name__ == '__main__':
   main()


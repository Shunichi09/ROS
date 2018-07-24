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
  
    def make_msg(self, message):
       # 処理を書く

    def send_msg(self):
        # messageを送信
        self.make_msg(message)
        self.publisher.publish(self.message)

class Subscribe_publishers():
    def __init__(self, pub):
        # Subscriberを作成
        self.subscriber = rospy.Subscriber('/topic_name', Pose2D, self.callback)
        # messageの型を作成
        self.message = Pose2D()
        # publsishu
      
   def callback(self, message):
        # callback時の処理
        self.pub.make_msg(message)
        # publish
        self.pub.send_msg()

def main():
    # nodeの立ち上げ
    rospy.init_node('Node_name')

    # クラスの作成
    pub = Publishsers()
    sub = Subscribe_publishers(pub)

    rospy.spin()

if __name__ == '__main__':
   main()


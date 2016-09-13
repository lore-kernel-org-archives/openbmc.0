Return-Path: <vishwa@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sYJ6z0pynzDrfR
 for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2016 18:41:14 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u8D8cHYp075393
 for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2016 04:41:12 -0400
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 by mx0b-001b2d01.pphosted.com with ESMTP id 25dwy0f0ct-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2016 04:41:12 -0400
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Tue, 13 Sep 2016 18:41:09 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 13 Sep 2016 18:41:06 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: vishwa@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id DB1962BB0055
 for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2016 18:41:05 +1000 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u8D8f5iw1900858
 for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2016 18:41:05 +1000
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u8D8f5l0020676
 for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2016 18:41:05 +1000
Received: from [9.79.228.187] ([9.79.228.187])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u8D8f41v020609
 for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2016 18:41:05 +1000
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: vishwa <vishwa@linux.vnet.ibm.com>
Subject: Interceptor for org.freedesktop.DBus.Properties.Set
Date: Tue, 13 Sep 2016 14:11:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------7FDBBB7341FBBAC3FC06742B"
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16091308-1617-0000-0000-000001569CD5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16091308-1618-0000-0000-000046B19748
Message-Id: <28a48a18-987a-31d8-2d3a-192be90884a4@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-09-13_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=15
 spamscore=15 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609020000
 definitions=main-1609130127
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Sep 2016 08:41:15 -0000

This is a multi-part message in MIME format.
--------------7FDBBB7341FBBAC3FC06742B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

/org/openbmc/settings/host0 provides the dbus properties that are 
settable via org.freedesktop.DBus.properties.Set.
The properties are treated as user settings and are consumed by 
respective daemons by having a signal handler registered for 
PropertyChanged method.

The challenge at the hand is "How to make sure the users that set the 
property are choosing a valid value".

Since its set by org.freedesktop.DBus.Properties.Set, the ideal way 
would be to register a callback that would validate the user input based 
on custom algo and then only would let the .Set continue.

Without an interceptor, the user settings may be as junk as "abcdef" and 
the *settings damon* can only react to that change and can put the 
previous value back into it post verification.

I did a lot of search on ways to register an interceptor and did not see 
one. I then asked in #dbus and they told me that there is no way to 
intercept that.

So the solution what I have at the moment is to

1) Disable the property set via freedesktop
2) Introduce a custom Setter "org.openbmc.Settings.Host.Set" which can 
do the job of validating the inputs also.

Please let me know if there are better approaches.

Thanks.

Vishwanatha Subbanna.

--------------7FDBBB7341FBBAC3FC06742B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <font size="+1">/org/openbmc/settings/host0 provides the dbus
      properties that are settable via
      org.freedesktop.DBus.properties.Set.<br>
      The properties are treated as user settings and are consumed by
      respective daemons by having a signal handler registered for
      PropertyChanged method.<br>
      <br>
      The challenge at the hand is "How to make sure the users that set
      the property are choosing a valid value".<br>
      <br>
      Since its set by org.freedesktop.DBus.Properties.Set, the ideal
      way would be to register a callback that would validate the user
      input based on custom algo and then only would let the .Set
      continue.<br>
      <br>
      Without an interceptor, the user settings may be as junk as
      "abcdef" and the *settings damon* can only react to that change
      and can put the previous value back into it post verification.<br>
      <br>
      I did a lot of search on ways to register an interceptor and did
      not see one. I then asked in #dbus and they told me that there is
      no way to intercept that.<br>
      <br>
      So the solution what I have at the moment is to<br>
      <br>
      1) Disable the property set via freedesktop<br>
      2) Introduce a custom Setter "org.openbmc.Settings.Host.Set" which
      can do the job of validating the inputs also.<br>
      <br>
      Please let me know if there are better approaches.<br>
      <br>
      Thanks.<br>
      <br>
      Vishwanatha Subbanna.<br>
    </font>
  </body>
</html>

--------------7FDBBB7341FBBAC3FC06742B--

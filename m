Return-Path: <vishwa@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vyf6Q0sbmzDqGv
 for <openbmc@lists.ozlabs.org>; Wed,  5 Apr 2017 18:25:17 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v358NZDe190469
 for <openbmc@lists.ozlabs.org>; Wed, 5 Apr 2017 04:25:05 -0400
Received: from e28smtp02.in.ibm.com (e28smtp02.in.ibm.com [125.16.236.2])
 by mx0b-001b2d01.pphosted.com with ESMTP id 29mv9xsysr-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 05 Apr 2017 04:25:04 -0400
Received: from localhost
 by e28smtp02.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Wed, 5 Apr 2017 13:55:01 +0530
Received: from d28relay05.in.ibm.com (9.184.220.62)
 by e28smtp02.in.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 5 Apr 2017 13:54:59 +0530
Received: from d28av08.in.ibm.com (d28av08.in.ibm.com [9.184.220.148])
 by d28relay05.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v358OraU12583122
 for <openbmc@lists.ozlabs.org>; Wed, 5 Apr 2017 13:54:53 +0530
Received: from d28av08.in.ibm.com (localhost [127.0.0.1])
 by d28av08.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v358OwCe031001
 for <openbmc@lists.ozlabs.org>; Wed, 5 Apr 2017 13:54:58 +0530
Received: from [9.193.99.239] (vishwa.in.ibm.com [9.193.99.239])
 by d28av08.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v358OwHJ030998
 for <openbmc@lists.ozlabs.org>; Wed, 5 Apr 2017 13:54:58 +0530
From: vishwa <vishwa@linux.vnet.ibm.com>
Subject: Discussion on GPIO monitoring and design thoughts.
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 5 Apr 2017 13:56:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
x-cbid: 17040508-0004-0000-0000-000005627E2C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17040508-0005-0000-0000-0000136090CF
Message-Id: <3ca9e8a5-4135-8fa3-cbf5-62543a89a491@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-05_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1704050075
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Apr 2017 08:25:19 -0000

We had a technical discussion on HOWTO and what is the right thing to do 
handling the GPIO assertion and here is the gist.

1) Use gpio-keys and utilize libevdev wrappers ( 
https://www.freedesktop.org/software/libevdev/doc/latest/ ) to watch for 
data in /dev/input/event.

2) Define a target with set of services that would be called into by the 
GPIO monitor application when the GPIO state changes to what is expected.

  - 2.1) Another option was to just broadcast a signal that interested 
parties could catch and act but then it was not chosen because there 
would be no guarantee that the signal would ever be delivered / caught 
by needed parties.

  - 2.2 ) Also going the signal way demands a service that just needs to 
watch for that.

*) The services that are part of the target will then own complete 
handling of the condition instead of the application that monitored the 
GPIO.

---------

Here is an example of application that handles the GPIO assertion that 
happens when host does a checkstop.

1) Application's arguments need /dev/input/event<$number> and the 
expected GPIO state as indicated by linux,code in :

http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/input/gpio-keys.txt

2) Call this app after reaching `Host-Running` state thus avoiding any 
checks to see current state.

2) App will then use libevdev wrappers to watch for the state

3) On seeing the expected state change, app calls into the configured 
target.

4) Configured target right now has 2 services.

   - 4.1 ) Service that Creates an errorlog indicating the checkstop
   - 4.2 ) Service that will start the Quiesce target

--------

This design direction helps decouple applications that monitor and 
analyze the conditions.

Please let me know your thoughts on this.

Thanks.

!! Vishwa !!

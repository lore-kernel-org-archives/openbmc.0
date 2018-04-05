Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Gxzh21dBzF1pk
 for <openbmc@lists.ozlabs.org>; Thu,  5 Apr 2018 19:17:03 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w359G5wS131345
 for <openbmc@lists.ozlabs.org>; Thu, 5 Apr 2018 05:17:01 -0400
Received: from e06smtp13.uk.ibm.com (e06smtp13.uk.ibm.com [195.75.94.109])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2h5esp5scx-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Apr 2018 05:17:00 -0400
Received: from localhost
 by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Thu, 5 Apr 2018 10:16:58 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 5 Apr 2018 10:16:55 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w359GtQd29229304; Thu, 5 Apr 2018 09:16:55 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 347164C046;
 Thu,  5 Apr 2018 10:09:43 +0100 (BST)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 283A94C059;
 Thu,  5 Apr 2018 10:09:42 +0100 (BST)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.202.245])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Apr 2018 10:09:41 +0100 (BST)
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Subject: Mapping IPMI boot device selector to D-Bbus properties
To: tomjose@linux.vnet.ibm.com, stewart@linux.vnet.ibm.com,
 vernon.mauery@linux.intel.com, emilyshaffer@google.com, a.amelkin@yadro.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 5 Apr 2018 14:46:55 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:52.0)
 Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18040509-0012-0000-0000-000005C74FD0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18040509-0013-0000-0000-0000194365F2
Message-Id: <e1297b05-25f0-3d74-1d03-92c26df4810a@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-04-05_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804050099
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Apr 2018 09:17:04 -0000

Hi,

We recently discovered an issue in the way the IPMI boot device selector 
(represented by a nibble in the boot flags) is mapped to the D-Bus model.

In the IPMI spec the boot device selector has options for both "boot 
source" (default/disk/crdom/network) and "boot mode" 
(default/bios/safe/diag). Since this isn't a bit-filed, you can't 
override for eg both the source and mode at the same time. It's probably 
debatable to say whether such a possibility is desirable or not (for eg 
I may want to set the boot source as network by default, but want to 
boot to safe mode the next boot , and revert back to network for 
subsequent boots without having to set the device again).

There are different D-Bus interfaces depicting the boot mode [1] and 
boot source [2] though. So when the IPMI boot device is changed, the 
ipmid code sets a relevant boot mode or source property. It's possible 
that both can get set when someone for eg sets the device to cdrom and 
then to bios. The issue is how should ipmid respond to a get boot 
options command - there's no way for ipmid to aggregate information from 
both D-Bus properties as in the IPMI spec only one of them can be 
represented. Today ipmid always favors the boot source property if both 
are set [3]. That's not what a user expects though, because the user 
would expect his last override to go through.

The solution I'm proposing is that if a set boot device is mapping to a 
boot source, then reset the boot mode D-Bus property to default, or vice 
versa. This way the ipmid code can determine which property is not at 
the default value. It doesn't break the behavior from an IPMI spec 
perspective because only one can be set at a point of time anyway, and 
we'll consume the latest override to the boot device. Other solutions or 
thoughts?

[1] 
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Control/Boot/Mode.interface.yaml
[2] 
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Control/Boot/Source.interface.yaml
[3] 
https://github.com/openbmc/phosphor-host-ipmid/blob/master/chassishandler.cpp#L1257

Thanks,
Deepak

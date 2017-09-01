Return-Path: <tomjose@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xkDcr5V9nzDqRM
 for <openbmc@lists.ozlabs.org>; Fri,  1 Sep 2017 19:35:40 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v819Ysih082317
 for <openbmc@lists.ozlabs.org>; Fri, 1 Sep 2017 05:35:37 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cq4u68p5d-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 01 Sep 2017 05:35:37 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Fri, 1 Sep 2017 03:35:36 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 1 Sep 2017 03:35:35 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v819ZYPW31981712
 for <openbmc@lists.ozlabs.org>; Fri, 1 Sep 2017 02:35:34 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7815A13603C
 for <openbmc@lists.ozlabs.org>; Fri,  1 Sep 2017 03:35:34 -0600 (MDT)
Received: from [9.202.32.168] (unknown [9.202.32.168])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id E735713603A
 for <openbmc@lists.ozlabs.org>; Fri,  1 Sep 2017 03:35:33 -0600 (MDT)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: tomjose <tomjose@linux.vnet.ibm.com>
Subject: IPMI support on OpenBMC
Date: Fri, 1 Sep 2017 15:05:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17090109-0008-0000-0000-00000881EDAF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007646; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00910621; UDB=6.00456823; IPR=6.00690901; 
 BA=6.00005563; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016957; XFM=3.00000015;
 UTC=2017-09-01 09:35:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17090109-0009-0000-0000-000043CC5F8C
Message-Id: <59A929E3.7040209@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-01_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709010140
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
X-List-Received-Date: Fri, 01 Sep 2017 09:35:41 -0000

This mail is to solicit feedback on the IPMI implementation on OpenBMC 
and figure out if any important feature is missing.
We have added support for IPMI over network(standard IPMI port) and the 
BT transfer. The first milestone we are trying to
achieve is to have support for all the mandatory IPMI commands. Below is 
a snapshot of current situation based on feature
and command support.

Supported Features:
---------------------------

-> Chassis Commands
-> SEL
-> FRU command
-> Serial Over LAN
-> Watchdog support
-> Sensor commands
-> Network Configuration
-> Boot Configuration


Work in Progress & Pending stuff:
-------------------------------------------

-> Full fledged SDR support
-> DCMI Compliance
-> User Management commands

Following is the list of the supported IPMI commands:

#<NetFn>:<Command
0x00:0x00    //<Chassis>:<Chassis Capabilities>
0x00:0x01    //<Chassis>:<Get Chassis Status>
0x00:0x02    //<Chassis>:<Chassis Control>
0x00:0x08    //<Chassis>:<Set System Boot Options>
0x00:0x09    //<Chassis>:<Get System Boot Options>
0x04:0x2D    //<Sensor/Event>:<Get Sensor Reading>
0x04:0x2F    //<Sensor/Event>:<Get Sensor Type>
0x04:0x30    //<Sensor/Event>:<Set Sensor Reading and Event Status>
0x06:0x01    //<App>:<Get Device ID>
0x06:0x02    //<App>:<Cold Reset>
0x06:0x03    //<App>:<Warm Reset>
0x06:0x04    //<App>:<Get Self Test Results>
0x06:0x08    //<App>:<Get Device GUID>
0x06:0x22    //<App>:<Reset Watchdog Timer>
0x06:0x24    //<App>:<Set Watchdog Timer>
0x06:0x2E    //<App>:<Set BMC Global Enables>
0x06:0x31    //<App>:<Get Message Flags>
0x06:0x35    //<App>:<Read Event Message Buffer>
0x06:0x36    //<App>:<Get BT Interface Capabilities>
0x06:0x40    //<App>:<Set Channel Access>
0x06:0x41    //<App>:<Get Channel Access>
0x06:0x42    //<App>:<Get Channel Info Command>
0x0A:0x10    //<Storage>:<Get FRU Inventory Area Info>
0x0A:0x11    //<Storage>:<Read FRU Data>
0x0A:0x12    //<Storage>:<Write FRU Data>
0x0A:0x40    //<Storage>:<Get SEL Info>
0x0A:0x42    //<Storage>:<Reserve SEL>
0x0A:0x44    //<Storage>:<Add SEL Entry>
0x0A:0x48    //<Storage>:<Get SEL Time>
0x0A:0x49    //<Storage>:<Set SEL Time>
0x0C:0x01    //<Transport>:<Set LAN Configuration Parameters>
0x0C:0x02    //<Transport>:<Get LAN Configuration Parameters>
0x2C:0x00    //<Group Extension>:<Group Extension Command>
0x2C:0x03    //<Group Extension>:<Get Power Limit>
0x2C:0x04    //<Group Extension>:<Set Power Limit>
0x2C:0x05    //<Group Extension>:<Activate/Deactivate Power Limit>
0x2C:0x06    //<Group Extension>:<Get Asset Tag>
0x2C:0x08    //<Group Extension>:<Set Asset Tag>

Regards,
Tom

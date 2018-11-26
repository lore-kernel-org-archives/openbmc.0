Return-Path: <tomjose@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 433SP81ljQzDqW1
 for <openbmc@lists.ozlabs.org>; Tue, 27 Nov 2018 00:26:35 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wAQDPDvn021507
 for <openbmc@lists.ozlabs.org>; Mon, 26 Nov 2018 08:26:33 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2p0epagqne-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 26 Nov 2018 08:26:33 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Mon, 26 Nov 2018 13:26:31 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 26 Nov 2018 13:26:28 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 wAQDQRM729229118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 26 Nov 2018 13:26:27 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5727611C054;
 Mon, 26 Nov 2018 13:26:27 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA09511C05B;
 Mon, 26 Nov 2018 13:26:26 +0000 (GMT)
Received: from [9.193.103.167] (unknown [9.193.103.167])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 26 Nov 2018 13:26:26 +0000 (GMT)
To: jason.m.bills@intel.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
Subject: IPMI SEL refactoring comments
Date: Mon, 26 Nov 2018 18:56:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18112613-0020-0000-0000-000002EDDB97
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18112613-0021-0000-0000-0000213D292F
Message-Id: <551365ea-c6e2-b3d6-c9a5-2b9cdced6120@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-26_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1811260122
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Nov 2018 13:26:36 -0000

Hello Jason,

I reviewed the patches for the IPMI SEL refactoring and wanted to 
summarize the concerns with the proposed design. There are some current 
features that are broken.

1) The sensor numbers are arbitrary in the proposed implementation and 
does not account for the presence/error corresponding to inventory 
objects. On IBM systems the host firmware does not rely on the SDR 
repository in BMC to figure out the sensor numbers, rather the sensor 
numbers are programmed into the  host firmware at the build time. So the 
sensor numbers cannot be arbitrary.

 > I know you are working on a proposal to have a customizable map of 
sensor number to path. The support is only for threshold based sensors( 
targeting only /xyz/openbmc_project/sensors namespace) , it needs to 
extend support for discrete sensors. The sensor types are limited to few 
types(temperature, voltage,current, fan_tach, power), need to support 
other sensor types in the specification. It might not be possible to 
deduce the sensor type from the D-Bus object path for all sensors.

2)  OpenPower systems like Witherspoon and Zaius relies on eSEL(extended 
SEL format) to report debug data from the host firmware. The eSEL data 
is added to the D-Bus native error log via the Add SEL entry command. 
This is not handled with the refactoring.

 > This is an openpower requirement and needs to be handled in an 
openpower IPMI OEM library/application and not in the phosphor 
implementation. A D-Bus error log containing eSEL can be created on 
completion of transfer of eSEL and not depend on Add SEL entry. The 
callouts associated with the eSEL can be added to the D-Bus error log by 
keeping a watch on the IPMI SEL entries. This might need changes to 
phosphor-logging API to support adding callout after creation of error 
log. This is a proposal and looks viable.

3) The current implementation the Get SEL entry is translating the D-Bus 
error log to IPMI SEL format. If there is a FRU callout associated with 
the D-Bus error log(D-Bus object paths in the inventory namespace) it is 
mapped to the sensor number associated with FRU and reported through SEL.

 > The implementation of the Get SEL entry needs to adapt to include all 
the objects paths(the patchsets target only /xyz/openbmc_project/sensors 
namespace) and map the D-Bus object path to the sensor numbers(based on  
the proposed customizable map).

4) In the current implementation all the D-Bus error logs have 1x1 
mapping in the IPMI SEL. In the proposed solution the users will have to 
rely on both D-Bus error logs and IPMI SEL to get the complete picture. 
The customers cannot rely only on IPMI SEL as an event repository.

 > In the current proposal D-Bus error logs reported by BMC will not be 
shown by SEL commands. I am okie with Jason's proposal to set up a D-Bus 
match (either by ipmid or phosphor-sel-logger) that will watch for new 
logging D-Bus objects to be created and add a SEL record for them on 
creation.

https://gerrit.openbmc-project.xyz/#/q/status:open++topic:%22IPMI+SEL%22

Regards,
Tom

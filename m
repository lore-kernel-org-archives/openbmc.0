Return-Path: <ratagupt@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 408t4W5454zF20n
 for <openbmc@lists.ozlabs.org>; Mon, 26 Mar 2018 23:00:10 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2QC02pN107182
 for <openbmc@lists.ozlabs.org>; Mon, 26 Mar 2018 08:00:07 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gxyvt1fpn-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 26 Mar 2018 08:00:04 -0400
Received: from localhost
 by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Mon, 26 Mar 2018 12:59:30 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 26 Mar 2018 12:59:27 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2QBxROB8454400; Mon, 26 Mar 2018 11:59:27 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F36B1A4059;
 Mon, 26 Mar 2018 12:52:04 +0100 (BST)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81181A4051;
 Mon, 26 Mar 2018 12:52:04 +0100 (BST)
Received: from [9.202.13.177] (unknown [9.202.13.177])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 26 Mar 2018 12:52:04 +0100 (BST)
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: Implement IPMI POH functionality
To: openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com
Date: Mon, 26 Mar 2018 17:29:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18032611-0008-0000-0000-000004E251FD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032611-0009-0000-0000-00001E75872B
Message-Id: <24f546e1-4766-e6f0-df54-eaa399ae7189@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-26_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803260131
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
X-List-Received-Date: Mon, 26 Mar 2018 12:00:12 -0000

Hi,

I would be explaining a rough idea of how we plan to go about,
This is related to https://github.com/openbmc/openbmc/issues/2979

Please share your thoughts and feedback on this proposal.

=>we were planning to add the property in the chassis interface
   which tells that since how many hours chassis was powered on.

=>This property gets updated by internal timer which wakes up after
   an hour and updates this property if chassis is powered on.

    1) Should we set the uptime to 0 if chassis state has been 
transitioned from
    PowerOn-->PowerOff

                              or

    2) Don't update this property for the chassis power off duration and 
update
    this property when the chassis state changes to PowerOn.

    What is community view on this?

    Our opinion is that we should go with option 2 as other 
implementation(AMI)
    does the same.

=> In factory reset case this property will reset to 0.

=>If BMC has been rebooted due to any reason,This property will not
   get updated for that duration and when BMC comes back,This timer
   kicks off and updates this property and it would be cumulative
   on what was the earlier value before BMC reboot.

=> Chassis object would be saved in nonvolatile storage to keep the last 
POH counter value.

=> Get functionality would be allowed,set would not be allowed from IPMI 
interface.

Regards
Ratan Gupta

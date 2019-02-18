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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44302F48xLzDqGn
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 21:08:53 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1IA3rr0123420
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 05:08:50 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qqt3uhsf3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 05:08:49 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Mon, 18 Feb 2019 10:08:47 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 18 Feb 2019 10:08:44 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1IA8hEI14942316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 18 Feb 2019 10:08:43 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A6E011C05C;
 Mon, 18 Feb 2019 10:08:43 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1854411C050;
 Mon, 18 Feb 2019 10:08:42 +0000 (GMT)
Received: from [9.193.103.188] (unknown [9.193.103.188])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 18 Feb 2019 10:08:41 +0000 (GMT)
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
Subject: Proposal for pldmtool
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Supreeth Venkatesh <supreeth.venkatesh@arm.com>,
 Alexander Amelkin <a.amelkin@yadro.com>, benwei@fb.com
Date: Mon, 18 Feb 2019 15:38:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19021810-0016-0000-0000-00000257B54F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19021810-0017-0000-0000-000032B1F316
Message-Id: <3151516d-0aa1-465c-be01-44b3d837fbce@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-18_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902180077
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
X-List-Received-Date: Mon, 18 Feb 2019 10:08:54 -0000

Hi All,

I wanted to put down initial thoughts on "pldmtool" which is a utility 
for controlling PLDM enabled devices. The naming of the utility was 
influenced by ipmitool which is a client utility to control IPMI enabled 
devices. The pldmtool acts as the requester and sends the PLDM message 
to target any PLDM enabled device. The PLDM response message is 
processed and expressed in human readable format.  This proposal needs 
to be considered on the basis of the pldm design 
(https://github.com/openbmc/docs/blob/master/designs/pldm-stack.md). 
These are possible pldmtool usage scenarios.

* pldmtool can run on OpenBMC and can target the PLDM daemon. PLDM 
daemon will have a D-Bus interface to accept PLDM requests.
* pldmtool can target other management controllers connected to BMC 
implementing PLDM stacks.
* A provision to run pldmtool targeting OpenBMC over a custom network 
port and route the request to the PLDM daemon.

These are the some of the salient features in the pldmtool that

* Provide user friendly command options
* Debug options to print detailed PLDM messages.
* Leverage libmctp and libpldm library getting developed for 
communicating with MCTP layer and for encoding/decoding PLDM messages. 
(https://github.com/openbmc/pldm, https://github.com/jk-ozlabs/libmctp)

The host firmware stacks typically have runtime constraints. If there is 
interest in having pldmtool run on host firmware then pldmtool will have 
to be written in C. Apart from this consideration the natural choice 
will be to develop this in modern C++.

This mail is a feeler to seek the interests of the community. I will be 
keen to follow-up this with a design template.

Thanks,
Tom

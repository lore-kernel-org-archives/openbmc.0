Return-Path: <prvs=0626aa5741=tomjose@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=prvs=0626aa5741=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40BfT14pyrzDqlc
 for <openbmc@lists.ozlabs.org>; Thu, 29 Mar 2018 20:24:02 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2T9Jq3w115428
 for <openbmc@lists.ozlabs.org>; Thu, 29 Mar 2018 05:23:59 -0400
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2h0vd8ts0q-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 29 Mar 2018 05:23:59 -0400
Received: from localhost
 by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Thu, 29 Mar 2018 10:23:57 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 29 Mar 2018 10:23:54 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2T9NrWb57606272; Thu, 29 Mar 2018 09:23:53 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51ABC4203F;
 Thu, 29 Mar 2018 10:15:51 +0100 (BST)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEAC442041;
 Thu, 29 Mar 2018 10:15:49 +0100 (BST)
Received: from [9.204.140.109] (unknown [9.204.140.109])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 29 Mar 2018 10:15:49 +0100 (BST)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
Subject: Attention users of network IPMI
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 Emily Shaffer <emilyshaffer@google.com>,
 Stewart Smith <stewart@linux.vnet.ibm.com>,
 Andrew Geissler <geissonator@gmail.com>
Date: Thu, 29 Mar 2018 14:53:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18032909-0044-0000-0000-00000541331C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032909-0045-0000-0000-0000288134CF
Message-Id: <d58f47d2-310c-f6cb-1ef0-6f7cae9bf7c0@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-29_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803290104
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
X-List-Received-Date: Thu, 29 Mar 2018 09:24:06 -0000

Hello,

Based on  feedback from the team writing management scripts for OpenBMC. 
There is a suggestion to
support the "-U" parameter when running the IPMI over network, to keep 
the script consistent across
multiple BMC implementations.

The support currently in  OpenBMC for the IPMI user accounts is the 
nameless account and the -U option
is not needed and only the -P option is needed. With the proposed 
change, "-U admin" is needed, for the
session setup to succeed. "root"  username was not preferred so that the 
user does not get confused with the
linux user account.

IPMITool usage with the proposed change:

ipmitool -I lanplus -H x.x.x.x -U admin -P 0penBmc <cmd>

https://gerrit.openbmc-project.xyz/#/c/9643/

Regards,

Tom

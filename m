Return-Path: <ratagupt@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4203xj24j9zDrRN
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 19:54:16 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7S9sAT6162754
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 05:54:13 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2m53pmh5x7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 05:54:13 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Tue, 28 Aug 2018 10:53:53 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 28 Aug 2018 10:53:51 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w7S9roUc38731908
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 Aug 2018 09:53:50 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B376A11C050;
 Tue, 28 Aug 2018 12:53:46 +0100 (BST)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A08311C04C;
 Tue, 28 Aug 2018 12:53:45 +0100 (BST)
Received: from [9.195.44.148] (unknown [9.195.44.148])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Aug 2018 12:53:45 +0100 (BST)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 richard.marian.thomaiyar@linux.intel.com
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: Enabling LDAP for Dropbear
Date: Tue, 28 Aug 2018 15:23:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18082809-0016-0000-0000-000001FCBF85
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18082809-0017-0000-0000-000032532F80
Message-Id: <dd28c1e6-bb95-178f-09e2-dbc8ab516773@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-28_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808280103
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Aug 2018 09:54:17 -0000

Hi All,

As part of enable LDAP on the BMC,We are enabling the LDAP on the 
dropbear(ssh server) through pam configuration,I am facing a problem 
when the ssh client trying to connect the bmc through ssh.

There are two steps involved when ssh client connect to the ssh server.
1) Authentication
2) Open the shell

I could have seen that authentication gets success but opening the shell 
got failed since the home directory should be existing for the ldap user.

To solve this I tried to make the following changes in the pam config file.

session required /lib/security/pam_mkhomedir.so skel=/etc/skel/ 
umask=0077 debug >>> pam_mkhomedir should have been created the directory.
session sufficient      pam_unix.so debug
session sufficient /lib/security/pam_ldap.so debug

Even after making the above changes I don't see that the home directory 
was created.

NOTE:- If I create the directory in advance then I am not facing this 
problem.

We have other option to solve this is to mount directories over network 
with the use of autofs service

https://help.ubuntu.com/community/AutofsLDAP

Can some body help me what could be other option to create the home 
directories and which one is used industry wise?

Ratan

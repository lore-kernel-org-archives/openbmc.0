Return-Path: <anoo@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 405tTS26B3zF1qr
 for <openbmc@lists.ozlabs.org>; Thu, 22 Mar 2018 02:07:55 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2LF7msD081711
 for <openbmc@lists.ozlabs.org>; Wed, 21 Mar 2018 11:07:53 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2guqntpkhq-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 21 Mar 2018 11:07:50 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Wed, 21 Mar 2018 09:06:46 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 21 Mar 2018 09:06:44 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2LF6him14549252; Wed, 21 Mar 2018 08:06:43 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D1AA78043;
 Wed, 21 Mar 2018 09:06:43 -0600 (MDT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 7600178038;
 Wed, 21 Mar 2018 09:06:43 -0600 (MDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 21 Mar 2018 10:07:43 -0500
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: ratagupt@linux.vnet.ibm.com
Subject: Handling persistent files during BMC updates
X-Sender: anoo@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18032115-0008-0000-0000-0000097CF3C1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008716; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.01006317; UDB=6.00512385; IPR=6.00785601; 
 MB=3.00020163; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-21 15:06:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032115-0009-0000-0000-0000467B3606
Message-Id: <7af014443d40e8d1e873f9be4af95322@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-21_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803210179
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
X-List-Received-Date: Wed, 21 Mar 2018 15:07:56 -0000

Hi all,

Two scenarios I wanted to get your thoughts on regarding persistent 
files during BMC updates:

1. Persistent file whitelists

The static code update method has various options to remove persistent 
files and preserve specific ones such as network configuration and those 
listed in a whitelist 
(https://github.com/openbmc/docs/blob/master/code-update/code-update.md#configure-update-settings).

Do you think the delete persistent files and/or whitelist option should 
be added to the software d-bus interfaces that implement the firmware 
update process 
(https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Software)?


2. Updating / merging persistent files

Ratan brought up this scenario that if for example a BMC image that has 
additional user accounts (and therefore a bigger /etc/group file) is 
installed on the BMC, the /etc/group file would not be updated because 
is part of the persistent files, so the old /etc/group file would 
remain.

A workaround would be for the user to clear the persistent filesystem 
prior the update, which may be undesired, and also how would the user 
know that they should clear the persistent filesystem before updating to 
a specific version.

Some options could include a list or flag that tells the update code 
that overwrite the persistent file during an update. We could also have 
options to merge the contents. Any thoughts?

Thanks!

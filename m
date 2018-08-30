Return-Path: <anoo@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 421WCJ0fHdzF36l
 for <openbmc@lists.ozlabs.org>; Fri, 31 Aug 2018 04:26:03 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7UIOapg002251
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 14:26:01 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2m6na89are-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 14:26:01 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Thu, 30 Aug 2018 14:26:00 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 30 Aug 2018 14:25:57 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w7UIPuqt46923994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 18:25:57 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3985B124053
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 15:26:34 -0400 (EDT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03AA5124052
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 15:26:33 -0400 (EDT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 15:26:33 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 30 Aug 2018 13:33:43 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: Factory Reset for Configuration Settings
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18083018-0064-0000-0000-000003449F58
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009640; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01081139; UDB=6.00557734; IPR=6.00861123; 
 MB=3.00023020; MTD=3.00000008; XFM=3.00000015; UTC=2018-08-30 18:25:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18083018-0065-0000-0000-00003A7AC805
Message-Id: <6cd1be38c05156b9b6d116fa643224db@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-30_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808300184
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
X-List-Received-Date: Thu, 30 Aug 2018 18:26:04 -0000

This note is to propose a new Factory Reset implementation to clear out 
configuration settings and restore them to default. The following 
applies for both static and ubi filesystem layouts.

The current Software implementation of the Factory Reset clears the 
whole read-write filesystem[1].
The reset can be problematic for example if it's issued when the host is 
on, since the inventory gets deleted and the fan controller has no 
knowledge if the system has working fans, leading to shutting off the 
host.
This can be unexpected if the user just wants to reset the configuration 
data, like user passwords or LDAP settings.

The /etc dir is intended to contain the configuration files[2], so we 
can implement the configuration reset by clearing out the data in /etc 
and putting back the defaults. The /etc dir is an overlay, so this can 
be accomplished by clearing the overlay's upper dir.

Proposal:
* Move any configuration file that is currently created in /var to /etc, 
like the Time Owner and Reboot Policy (most are currently under the 
Settings interface).
* Have the init script which mounts the overlay, clear the etc upper dir 
before mounting if a u-boot environment variable is set.
* Implement a new Reset method under the path 
/xyz/openbmc_project/settings/ or configuration/ or 
settings/configuration/ or other.


---
[1] 
https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Common/FactoryReset#xyzopenbmc_projectsoftwarebmcupdater

[2] https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s07.html

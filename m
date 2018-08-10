Return-Path: <mspinler@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41nJ1g28xJzDrZC
 for <openbmc@lists.ozlabs.org>; Sat, 11 Aug 2018 07:20:22 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7ALJP2Z123748
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 17:20:20 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ksgmquqtm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 17:20:20 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Fri, 10 Aug 2018 17:20:18 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 10 Aug 2018 17:20:15 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w7ALKEHN9634340
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 21:20:14 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1964F124054
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 18:21:17 -0400 (EDT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8346124058
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 18:21:16 -0400 (EDT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 18:21:16 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 10 Aug 2018 16:27:11 -0500
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: Disable Local Users Proposal
X-Sender: mspinler@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18081021-0072-0000-0000-0000038EEA2E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009520; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01071775; UDB=6.00552013; IPR=6.00851593; 
 MB=3.00022642; MTD=3.00000008; XFM=3.00000015; UTC=2018-08-10 21:20:17
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18081021-0073-0000-0000-0000490900FD
Message-Id: <47cb0391a568d16cbdc0345893eeb282@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-10_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=454 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808100224
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
X-List-Received-Date: Fri, 10 Aug 2018 21:20:23 -0000

Hi,

We have a requirement to disable all local accounts on the BMC,
including root, so the only logins allowed would be via LDAP 
authenticated
accounts.

It was recommended that I do this by removing the pam_unix module from
/etc/pam.d/common-auth and/or common-account(I think?), and also remove
~/.ssh/authorized_keys if present.

I see that the upcoming user manager code in
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-user-manager/+/10112/
doesn't deal with system accounts, which we also need to disable, so my 
proposal
is to add an 'AllLocalAccountsDisabled' property to 
xyz.openbmc_projects.Users.Manager
to do the disable/reenable by modifying the PAM files.

I'm thinking this would be independent of the UserEnabled property in 
the
Users.Attributes interface, though I could also do the 
UserEnabled(false)
on all existing users and disallow anyone from setting to true.

There seems to be a bug in the REST server right now that still allows 
REST
access with a root login with root disabled, so that would need to be 
fixed,
but eventually one could still use LDAP authenticated users to make REST 
calls.

This would not affect IPMI.

Comments/ideas welcome

Matt

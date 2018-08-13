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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41ppc323cjzF0Rr
 for <openbmc@lists.ozlabs.org>; Mon, 13 Aug 2018 18:21:54 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7D8EIUg133855
 for <openbmc@lists.ozlabs.org>; Mon, 13 Aug 2018 04:21:52 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ku60k132h-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 13 Aug 2018 04:21:52 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Mon, 13 Aug 2018 09:21:50 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 13 Aug 2018 09:21:48 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w7D8LlC438273108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 13 Aug 2018 08:21:47 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0B9152054;
 Mon, 13 Aug 2018 11:21:51 +0100 (BST)
Received: from [9.202.13.177] (unknown [9.202.13.177])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 391A752051;
 Mon, 13 Aug 2018 11:21:51 +0100 (BST)
Subject: Re: Disable Local Users Proposal
To: Matt Spinler <mspinler@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <47cb0391a568d16cbdc0345893eeb282@linux.vnet.ibm.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Mon, 13 Aug 2018 13:51:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <47cb0391a568d16cbdc0345893eeb282@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18081308-0028-0000-0000-000002E9F23A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18081308-0029-0000-0000-000023A30C4F
Message-Id: <3f6ddc8e-17a9-41cb-9478-e3d4fc66b9af@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-13_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=933 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808130092
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
X-List-Received-Date: Mon, 13 Aug 2018 08:21:55 -0000

Hi Matt,

Please find my comments inline

Ratan



On Saturday 11 August 2018 02:57 AM, Matt Spinler wrote:
> Hi,
>
> We have a requirement to disable all local accounts on the BMC,
> including root, so the only logins allowed would be via LDAP 
> authenticated
> accounts.
>
> It was recommended that I do this by removing the pam_unix module from
> /etc/pam.d/common-auth and/or common-account(I think?), and also remove
> ~/.ssh/authorized_keys if present.
By removing the authorized_keys means if somebody have uploaded their 
keys to enable the password
less login.
so by doing so we are removing that possibility.Is it correct or is 
there some other intent?
>
> I see that the upcoming user manager code in
> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-user-manager/+/10112/ 
>
> doesn't deal with system accounts, which we also need to disable, so 
> my proposal
> is to add an 'AllLocalAccountsDisabled' property to 
> xyz.openbmc_projects.Users.Manager
> to do the disable/reenable by modifying the PAM files.
>
> I'm thinking this would be independent of the UserEnabled property in the
> Users.Attributes interface, though I could also do the UserEnabled(false)
> on all existing users and disallow anyone from setting to true.
I agree with you on introducing other property 
"AllLocalAccountsDisabled" but we should
be consistent that each individual user status should also show its 
status as disabled.
it should not be that if admin does enumerate on the users namespace 
then manager
interface shows that AllLocalAccountsDisabled is true but each 
individual user property show the
userEnabled as true.
>
> There seems to be a bug in the REST server right now that still allows 
> REST
> access with a root login with root disabled, so that would need to be 
> fixed,
> but eventually one could still use LDAP authenticated users to make 
> REST calls.
>
> This would not affect IPMI.
>
> Comments/ideas welcome
>
> Matt
>

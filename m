Return-Path: <mspinler@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41qbqb2KdnzF15Q
 for <openbmc@lists.ozlabs.org>; Wed, 15 Aug 2018 01:19:39 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7EFEFlw125493
 for <openbmc@lists.ozlabs.org>; Tue, 14 Aug 2018 11:19:36 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2kuxx1frg3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 14 Aug 2018 11:19:36 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Tue, 14 Aug 2018 11:19:35 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 Aug 2018 11:19:33 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w7EFJW9L63635522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 14 Aug 2018 15:19:32 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43B82112062;
 Tue, 14 Aug 2018 11:19:12 -0400 (EDT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9D87112064;
 Tue, 14 Aug 2018 11:19:11 -0400 (EDT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 14 Aug 2018 11:19:11 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 14 Aug 2018 10:26:38 -0500
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Disable Local Users Proposal
In-Reply-To: <3f6ddc8e-17a9-41cb-9478-e3d4fc66b9af@linux.vnet.ibm.com>
References: <47cb0391a568d16cbdc0345893eeb282@linux.vnet.ibm.com>
 <3f6ddc8e-17a9-41cb-9478-e3d4fc66b9af@linux.vnet.ibm.com>
X-Sender: mspinler@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18081415-2213-0000-0000-000002DAC9D6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009543; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01073435; UDB=6.00553093; IPR=6.00853392; 
 MB=3.00022713; MTD=3.00000008; XFM=3.00000015; UTC=2018-08-14 15:19:34
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18081415-2214-0000-0000-00005B32E445
Message-Id: <1b46768ae45e718f5000801222996318@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-14_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=782 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808140156
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
X-List-Received-Date: Tue, 14 Aug 2018 15:19:39 -0000

On 2018-08-13 03:21, Ratan Gupta wrote:
> Hi Matt,
> 
> Please find my comments inline
> 
> Ratan
> 
> 
> 
> On Saturday 11 August 2018 02:57 AM, Matt Spinler wrote:
>> Hi,
>> 
>> We have a requirement to disable all local accounts on the BMC,
>> including root, so the only logins allowed would be via LDAP 
>> authenticated
>> accounts.
>> 
>> It was recommended that I do this by removing the pam_unix module from
>> /etc/pam.d/common-auth and/or common-account(I think?), and also 
>> remove
>> ~/.ssh/authorized_keys if present.
> By removing the authorized_keys means if somebody have uploaded their
> keys to enable the password
> less login.
> so by doing so we are removing that possibility.Is it correct or is
> there some other intent?

It would disable them when the property is set, but then I guess other
users could add them again.  Not sure what else I could do here.

>> 
>> I see that the upcoming user manager code in
>> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-user-manager/+/10112/ 
>> doesn't deal with system accounts, which we also need to disable, so 
>> my proposal
>> is to add an 'AllLocalAccountsDisabled' property to 
>> xyz.openbmc_projects.Users.Manager
>> to do the disable/reenable by modifying the PAM files.
>> 
>> I'm thinking this would be independent of the UserEnabled property in 
>> the
>> Users.Attributes interface, though I could also do the 
>> UserEnabled(false)
>> on all existing users and disallow anyone from setting to true.
> I agree with you on introducing other property
> "AllLocalAccountsDisabled" but we should
> be consistent that each individual user status should also show its
> status as disabled.
> it should not be that if admin does enumerate on the users namespace
> then manager
> interface shows that AllLocalAccountsDisabled is true but each
> individual user property show the
> userEnabled as true.


Yea, good point.  Will make them agree.

I put up the D-Bus interface at
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/11934/


>> 
>> There seems to be a bug in the REST server right now that still allows 
>> REST
>> access with a root login with root disabled, so that would need to be 
>> fixed,
>> but eventually one could still use LDAP authenticated users to make 
>> REST calls.
>> 
>> This would not affect IPMI.
>> 
>> Comments/ideas welcome
>> 
>> Matt
>> 

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
 by lists.ozlabs.org (Postfix) with ESMTPS id 420Bcz1nlQzDrRN
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 00:55:13 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7SErs52120507
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 10:55:11 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2m585d9a1k-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 10:55:11 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Tue, 28 Aug 2018 15:55:08 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 28 Aug 2018 15:55:06 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w7SEt5lG4784292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 Aug 2018 14:55:05 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E025511C04C;
 Tue, 28 Aug 2018 17:55:01 +0100 (BST)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D58E11C04A;
 Tue, 28 Aug 2018 17:55:01 +0100 (BST)
Received: from [9.193.103.190] (unknown [9.193.103.190])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 28 Aug 2018 17:55:01 +0100 (BST)
Subject: Re: Mapping LDAP group to user roles
To: "Tanous, Ed" <ed.tanous@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1b935f90-dba3-ba95-f6b1-d8d2ff186ee7@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E821699345832E4D@ORSMSX114.amr.corp.intel.com>
 <2d7b2647-cc0a-bcaf-c1fa-d6da05769502@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E821699345834D5D@ORSMSX114.amr.corp.intel.com>
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
Date: Tue, 28 Aug 2018 20:25:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345834D5D@ORSMSX114.amr.corp.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18082814-0012-0000-0000-0000029FEBA2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18082814-0013-0000-0000-000020D3F3E8
Message-Id: <1ab96997-92ac-87fb-7d45-795d5747e4aa@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-28_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808280151
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
X-List-Received-Date: Tue, 28 Aug 2018 14:55:15 -0000


On Thursday 23 August 2018 09:59 PM, Tanous, Ed wrote:
>>> It would be great if you could document your proposal as a patch to the
>> existing user management document here:
>>> https://github.com/openbmc/docs/blob/master/user_management.md
>> https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/12091/
> This is a great start, but a lot of detail seems to be missing.  You don't mention anything of the two user roles you mentioned in your original email.  Has that changed?  I don't see any mention of the dbus interface, has that changed?  I don't see that you've modified any of the login flows in the document, but the LDAP section talks about authorizing users via DBus, which certainly should include changes to the flow diagrams.
Thanks Ed for the feedback. The D-Bus interface is updated to support 
all the privilege roles supported by OpenBMC. The document ha sonly the 
user creation flows. Richard mentioned he has the login flows updated in 
the downstream and he will upstream it. So I will update the 
authorization flow on top of  that.

Documentation:
https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/12091/

D-Bus Interface:
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/12027/
> It would be great if you could take another pass at this, and see if you could add a little more detail to your proposal.
>
> Thanks,
>
> -Ed

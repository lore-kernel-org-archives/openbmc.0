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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43zwVn6LzyzDqRc
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 21:19:29 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1DAHpmd142788
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 05:19:27 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qmemp77js-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 05:19:26 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Wed, 13 Feb 2019 10:19:24 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 13 Feb 2019 10:19:21 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1DAJK0B30212288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 13 Feb 2019 10:19:20 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEB7811C04C;
 Wed, 13 Feb 2019 10:19:20 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B777A11C04A;
 Wed, 13 Feb 2019 10:19:19 +0000 (GMT)
Received: from [9.80.209.105] (unknown [9.80.209.105])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 13 Feb 2019 10:19:19 +0000 (GMT)
To: openbmc@lists.ozlabs.org, ed.tanous@intel.com
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: Redfish query(AccountService)
Date: Wed, 13 Feb 2019 15:49:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19021310-0028-0000-0000-0000034806FB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19021310-0029-0000-0000-0000240629F0
Message-Id: <de3b0df2-f53b-9000-4723-4fda7f895e0d@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-13_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=765 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902130075
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
X-List-Received-Date: Wed, 13 Feb 2019 10:19:30 -0000

Hi,

Need your input on following query

As part of the the github story 
https://github.com/ibm-openbmc/dev/issues/232 which is to support the 
"RemoteRoleMapping" under LDAP property in AccountService

RemoteRoleMapping is a property of type collection of mapping rules 
under LDAP property.

eg GET Request is as follows(truncated output)

"LDAP": {
             "RemoteRoleMapping": [
             {
                 "RemoteUser": "cn=Manager,dc=example,dc=org",
                 "LocalRole": "Admin"
             },
         {
                 "RemoteUser": "cn=Admins,ou=Groups,dc=example,dc=org",
                 "LocalRole": "Admin"
             },
             {
                 "RemoteUser": "cn=PowerUsers,ou=Groups,dc=example,dc=org",
                 "LocalRole": "Operator"
             },
     ]
}

We have the following use cases for the PATCH request on RemoteRoleMapping

=> How to add the Role Mapping?

  PATCH { "RemoteRoleMapping": [{"RemoteUser": 
"Admingroup15","LocalRole": "User"},{"RemoteUser": "Admingroup13", 
"LocalRole": "Administrator"},{"RemoteUser": "Admingroup14", 
"LocalRole": "Operator"}]}

With the above PATCH request all the above role mapping gets added.

=> How to delete a specific role mapping,

let's continue the above eg, After addding the above roles mapping, user 
want to delete the second mapping which is ({"RemoteUser": 
"Admingroup13", "LocalRole": "Administrator"})

Following PATCH request would be used.
PATCH {"RemoteRoleMapping": [{},null,{}]}'

Now we have the following two roles mapping

{"RemoteUser": "Admingroup15",
   LocalRole": "User"
}
{"RemoteUser": "Admingroup14",
  "LocalRole": "Operator"
}


=> Let's take a case where user want to update the second role mapping, 
User would use the following PATCH request.

PATCH {"RemoteRoleMapping": [{},{"RemoteUser": 
"NewUserName","LocalRole": "Operator"}]}

Do you see any other use case for the PATCH request for the 
"RemoteRoleMapping" or any changes in the above PATCH request?

Looking for your inputs

Ratan

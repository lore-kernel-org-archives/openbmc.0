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
 by lists.ozlabs.org (Postfix) with ESMTPS id 447NRC6tvnzDqPX
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 00:42:14 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1PDYKwC082739
 for <openbmc@lists.ozlabs.org>; Mon, 25 Feb 2019 08:42:08 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qvfd6e9q4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 25 Feb 2019 08:42:08 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Mon, 25 Feb 2019 13:42:02 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 25 Feb 2019 13:41:59 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1PDfwSo30277798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 25 Feb 2019 13:41:58 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1B864203F;
 Mon, 25 Feb 2019 13:41:58 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0795542049;
 Mon, 25 Feb 2019 13:41:58 +0000 (GMT)
Received: from [9.202.13.25] (unknown [9.202.13.25])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 25 Feb 2019 13:41:57 +0000 (GMT)
To: openbmc@lists.ozlabs.org, ed.tanous@intel.com
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: Redfish: Design User authorization.
Date: Mon, 25 Feb 2019 19:11:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19022513-0012-0000-0000-000002F9EB14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19022513-0013-0000-0000-000021318B80
Message-Id: <b7596cbb-14f6-2d03-6860-840fb2ee7a7f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-25_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=422 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902250100
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
X-List-Received-Date: Mon, 25 Feb 2019 13:42:16 -0000

Hi Ed,

This mail is regarding the authorization support on Redfish.

In Redfish we have two types of privilege.

1) User Privilege

Redfish Authorization uses Roles and Privileges to control which users 
have what access to
resources.

We can have static mapping of Roles and assigned privileges
      Role = "Administrator"
           Privileges = Login, ConfigureManager, 
ConfigureUsers,ConfigureComponents, ConfigureSelf
      Role = "Operator"
           Privileges = Login, ConfigureComponents, ConfigureSelf
      Role = "ReadOnly"
           Privileges = Login, ConfigureSelf

Currently in phsophor-user-manager all the default Roles/Privileges is 
hardcoded.

we need to map privilege name/Role to the RoleName of the Redfish.
Static mapping is needed in the Redfish code for the same.

    eg priv-admin = Administrator.

Once we have the above mapping ready we will add the user role in the 
session object itself during creation of the session.
we can get the user role/privilege by calling the D-bus method on 
phosphor-user-manager.
Gerrit commit is up for the same.


2) Entity privilege =>(Operation to Privilege) mapping

    Currently each redfish node have the entity privilege structure, 
which is supposed to be consumed
    when the redfish request is being recieved by the redfish node class.
    In the dispatchRequest funtion of node.hpp
     => Check what is entity privilege
     => Check what is user privilege
     => If the user is having that privilege then allow the request 
otherwise not.

     Eg: If a PATCH operation is performed on the Account Service and 
the entity privilege
     for the Account service PATCH operation is "ConfigureUsers" and the 
User Role which we get
     From the session request have the same privilege then allow the 
operation.

I can see that in current Redfish code User Privileges is hardcoded and 
it is allowing all
users to do any operation.

Can I get your feedback on the same?

Ratan

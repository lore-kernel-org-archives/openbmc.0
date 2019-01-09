Return-Path: <jrey@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43ZknJ48tCzDqYk
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 09:48:36 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 x09MmWTY081132
 for <openbmc@lists.ozlabs.org>; Wed, 9 Jan 2019 17:48:34 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2pwq4rqgkm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 09 Jan 2019 17:48:33 -0500
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.vnet.ibm.com>;
 Wed, 9 Jan 2019 22:48:31 -0000
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 9 Jan 2019 22:48:30 -0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x09MmTth12058754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Wed, 9 Jan 2019 22:48:29 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0E3B2805E
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jan 2019 22:48:28 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FC0028065
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jan 2019 22:48:28 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jan 2019 22:48:28 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 09 Jan 2019 16:53:48 -0600
From: Joseph Reynolds <jrey@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: Plan to unify REST authentication?
X-Sender: jrey@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19010922-0060-0000-0000-000002F6469A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010375; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000274; SDB=6.01144172; UDB=6.00595724; IPR=6.00924434; 
 MB=3.00025056; MTD=3.00000008; XFM=3.00000015; UTC=2019-01-09 22:48:30
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19010922-0061-0000-0000-000047DC9E1B
Message-Id: <25320ca6593fb75714e0930d64c85c4b@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-09_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901090182
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
X-List-Received-Date: Wed, 09 Jan 2019 22:48:37 -0000

What is the plan to unify the Redfish and Phosphor REST authentication 
mechanisms?

Here is my understanding:

OpenBMC has two different HTTP servers which serve two different sets of 
REST APIs:
1. BMCWeb serves Redfish REST APIs (when BMCWEB_ENABLE_REDFISH is used 
[1]) and serves Phosphor REST APIs [2] (when BMCWEB_ENABLE_DBUS_REST is 
used [1]) via a C++ implementation in bmcweb.
2. The meta-ibm nginx configuration [3] serves Redfish (via BMCWeb 
listening at port 8082) and serves Phosphor REST APIs (via the 
Python-based phosphor-rest-server [4] listening at port 8081).

The project's direction is to move exclusively to BMCWeb (and 
discontinue using nginx) and Redfish (and discontinue using 
phosphor-rest).  Note that the BMCWeb C++ Phosphor REST implementation 
does not yet offer the same functions as provided by the Python-based 
phosphor-rest-server APIs, and work is in-progress to achieve required 
functions in bmcweb [5] and phosphor-objmgr [6].  Development work might 
happen like this (the staging plan):

1. Continue working on BMCWeb Phosphor REST functions until 
openbmc-test-automation [7] tests pass.
2. Change the meta-ibm layer to use BMCWeb with BMCWEB_ENABLE_DBUS_REST, 
and discontinue using nginx.
3. Continue adding Redfish functions to BMCWeb until we no longer need 
Phosphor REST functions.
4. Change the meta-ibm layer so BMCWeb no longer uses 
BMCWEB_ENABLE_DBUS_REST by default.

When this is all done, we will have achieved the goal of using BMCWeb 
and Redfish exclusively.

Note that the Redfish REST APIs and the Phosphor REST APIs use different 
authentication mechanisms.  Both take your username and password but 
return different credentials (which are needed for subsequent privileged 
access).  For Redfish, posting to /redfish/v1/SessionService/Sessions 
returns a session id and an X-Auth-Token [8].  For Phosphor REST, 
posting to /login returns a Session Cookie [2].

Applications such as the phosphor-webui web application and xcat 
currently use the Phosphor REST APIs, but will begin to use the Redfish 
REST APIs, perhaps using both sets of APIs in the same application.   
Will they need to login to both sets of REST APIs?

In this context, what is the plan to unify the authentication scheme?  I 
heard something about changing BMCWeb's version of the Phosphor REST 
APIs so that when you post to /login, you get the same credentials as 
from /redfish/v1/SessionService/Sessions.  Will I be able to login using 
/login and use Redfish APIs, and vice-versa?

- Joseph
__________

[BMCWeb]: https://github.com/openbmc/bmcweb/blob/master/README.md
[nginx]: https://www.nginx.com/
[phosphor-webui]: 
https://github.com/openbmc/phosphor-webui/blob/master/README.md
[xcat]: https://xcat.org/
[1]: https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt
[2]: https://github.com/openbmc/docs/blob/master/rest-api.md
[3]: 
https://github.com/openbmc/meta-ibm/blob/master/recipes-httpd/nginx/files/nginx.conf
[4]: https://github.com/openbmc/phosphor-rest-server
[5]: https://gerrit.openbmc-project.xyz/#/q/project:openbmc/bmcweb
[6]: 
https://gerrit.openbmc-project.xyz/#/q/project:openbmc/phosphor-objmgr
[7]: 
https://github.com/openbmc/openbmc-test-automation/blob/master/README.md
[8]: https://github.com/openbmc/docs/blob/master/REDFISH-cheatsheet.md

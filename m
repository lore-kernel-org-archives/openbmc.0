Return-Path: <jrey@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43GhRY4npWzDrK2
 for <openbmc@lists.ozlabs.org>; Sat, 15 Dec 2018 07:07:36 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wBEK4TKU062182
 for <openbmc@lists.ozlabs.org>; Fri, 14 Dec 2018 15:07:33 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2pcg7gg443-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 14 Dec 2018 15:07:33 -0500
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.vnet.ibm.com>;
 Fri, 14 Dec 2018 20:07:32 -0000
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 14 Dec 2018 20:07:30 -0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 wBEK7TMt20709508
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 14 Dec 2018 20:07:29 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D91A28060;
 Fri, 14 Dec 2018 20:07:29 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4C9928059;
 Fri, 14 Dec 2018 20:07:28 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 14 Dec 2018 20:07:28 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Fri, 14 Dec 2018 14:11:42 -0600
From: Joseph Reynolds <jrey@linux.vnet.ibm.com>
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: Sivas Srr <sivas.srr@in.ibm.com>, openbmc@lists.ozlabs.org, openbmc
 <openbmc-bounces+jrey=linux.vnet.ibm.com@lists.ozlabs.org>
Subject: RE: Max number of REST sessions
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169934597DCA5@ORSMSX114.amr.corp.intel.com>
References: <OF93226FA1.3C93F249-ON00258363.0041D36F-00258363.0041D8B5@notes.na.collabserv.com>
 <7E9441B1E5EFFD4681F54958E82169934597DCA5@ORSMSX114.amr.corp.intel.com>
X-Sender: jrey@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18121420-0064-0000-0000-00000386823F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010225; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000271; SDB=6.01131790; UDB=6.00588217; IPR=6.00911921; 
 MB=3.00024693; MTD=3.00000008; XFM=3.00000015; UTC=2018-12-14 20:07:31
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18121420-0065-0000-0000-00003BAED6E4
Message-Id: <585e5b49c14ba691a3a6c7ae0a7ffa70@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-14_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812140170
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
X-List-Received-Date: Fri, 14 Dec 2018 20:07:38 -0000

On 2018-12-14 09:10, Tanous, Ed wrote:
> Today, there is no session count limit, aside from your BMCs RAM
> limitations to store a small struct for each user session, although
> there should be. In the past when this has come up, there were
> questions about what the behavior should be when user sessions roll
> past the limit.

 From the Redfish specs [1] DSP0266 1.6.0 Redfish API Specification 20 
Sep 2018 [2]:

>>>> Section 9.2.4.1. Session life cycle management
>>>> Session management is left to the implementation of the Redfish 
>>>> Service. This includes orphaned session timeout and number of 
>>>> simultaneous open sessions.

[1]: https://www.dmtf.org/standards/redfish
[2]: 
https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.6.0.pdf

Note the BMCWeb Redfish implementation effectively defines OpenBMC's 
Redfish session management policy.  As such, I vote we document that 
policy, specifically, the decisions we are making now, including 
existing behavior like persisting sessions across a server restart.

> Some of the proposed solutions that I’ve heard in the past:
> 
> 1. Impose session limits either per user, per connecting ip address,
> or both. When a user rolls past the limit, one of two things can
> happen:
> 
>  a. New sessions are rejected until old sessions time out.

It looks like BMCWeb Redfish sessions have a 60 minute idle timeout (ref 
bmcweb/include/sessions.hpp class SessionStore [3]) which means they 
stay active indefinitely when they are used at least once every 60 
minutes.  This is consistent with the spec (9.2.4.5. Session lifetime).

[3]: 
https://github.com/openbmc/bmcweb/blob/aceb7fc879578407879af2f456458d080e39ec2d/include/sessions.hpp#L101

>  b. New sessions will “push out” the oldest session in the queue.

This seems like a good approach.  What maximum number of simultaneous 
sessions?  Several dozen?

Does "oldest" refer to the sequence in which sessions were established?  
I assume it does not mean "least recently used".


> 2. Use session tokens encrypted with a BMC secret (similar to json web
> token) and don’t store the session information on the BMC at all.
> This would effectively remove all the session limits
> 
> 3. “Reuse” sessions per user account, effectively capping the
> session count to the number of users or less
> 
> In my opinion, someone (possibly me) should put together a patchset to
> execute on 1b. What are other people’s requirements in this area?
> Did I miss anything?

What do other Redfish implementations do?

> -Ed

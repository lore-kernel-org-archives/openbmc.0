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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43lFZx0hFrzDqDb
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 06:24:08 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0NJJnIE064745
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 14:24:06 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2q6x4crkbn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 14:24:06 -0500
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Wed, 23 Jan 2019 19:24:05 -0000
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 23 Jan 2019 19:24:03 -0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x0NJO2da26280006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 19:24:02 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7F3D6E04C
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 19:24:02 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC8E76E052
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 19:24:02 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 19:24:02 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Wed, 23 Jan 2019 13:29:57 -0600
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: Re: Plan to unify REST authentication?
In-Reply-To: <8d289e19-dcaa-e0d5-5729-8863e0527470@intel.com>
References: <25320ca6593fb75714e0930d64c85c4b@linux.vnet.ibm.com>
 <8d289e19-dcaa-e0d5-5729-8863e0527470@intel.com>
X-Sender: mspinler@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19012319-0020-0000-0000-00000EB018B9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010464; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000275; SDB=6.01150738; UDB=6.00599710; IPR=6.00931075; 
 MB=3.00025262; MTD=3.00000008; XFM=3.00000015; UTC=2019-01-23 19:24:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19012319-0021-0000-0000-000064878B54
Message-Id: <6d24a3285407c428ccd89fd7900875d2@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-23_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901230142
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
X-List-Received-Date: Wed, 23 Jan 2019 19:24:09 -0000

Hi,

I've been working quite a bit to get bmcweb's REST APIs working well
enough to pass all of our existing robot testcases, and I'd say it's at
a point now where I think we can proceed with replacing phosphor-rest
with bmcweb as the REST server in meta-phosphor, and of course also in
meta-ibm.  There are 2 or so commits that still need to merge in either
bmcweb or openbmc-test-automation, but that will happen imminently.

The basic commit to do this is:
https://gerrit.openbmc-project.xyz/#/c/openbmc/openbmc/+/14172/.

There are also a few other commits to remove nginx as well in the
IBM layer.

As Ed mentioned below, bmcweb has CSRF prevention enabled, which
requires one to pass in a token, obtained from the login, to do
PUTs and POSTs.  The web UI and the robot tests handle this. Are
there any concerns with this protection being in master?

Any other concerns, questions, etc about doing this?

Thanks,
Matt


On 2019-01-14 11:17, Ed Tanous wrote:
> On 1/9/19 2:53 PM, Joseph Reynolds wrote:
>> The project's direction is to move exclusively to BMCWeb (and
>> discontinue using nginx) and Redfish (and discontinue using
>> phosphor-rest).
> 
> This is my long term goal as well, and how Intel systems currently
> operate (despite the bugs it currently causes)
> 
>>   Note that the BMCWeb C++ Phosphor REST implementation
>> does not yet offer the same functions as provided by the Python-based
>> phosphor-rest-server APIs, and work is in-progress to achieve required
>> functions in bmcweb [5] and phosphor-objmgr [6].
> The c++ mapper was merged already, and seems to be stable.
>>   Development work might
>> happen like this (the staging plan):
>> 
>> 1. Continue working on BMCWeb Phosphor REST functions until
>> openbmc-test-automation [7] tests pass.
>> 2. Change the meta-ibm layer to use BMCWeb with 
>> BMCWEB_ENABLE_DBUS_REST,
>> and discontinue using nginx.
> 
> A possible path for this step is staged here:
> 
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/14171
> 
>> 3. Continue adding Redfish functions to BMCWeb until we no longer need
>> Phosphor REST functions.
> 
> This point warrants much greater discussion, but I think we need to get
> through 1 and 2 before we start diving into the details on how to
> execute moving phosphor REST to Redfish.
> 
>> 4. Change the meta-ibm layer so BMCWeb no longer uses
>> BMCWEB_ENABLE_DBUS_REST by default.
> 
> I'm not following this one.  I suspect you meant to say the opposite?
> 
>> When this is all done, we will have achieved the goal of using BMCWeb
>> and Redfish exclusively.
>> 
>> Note that the Redfish REST APIs and the Phosphor REST APIs use 
>> different
>> authentication mechanisms.  Both take your username and password but
>> return different credentials (which are needed for subsequent 
>> privileged
>> access).  For Redfish, posting to /redfish/v1/SessionService/Sessions
>> returns a session id and an X-Auth-Token [8].  For Phosphor REST,
>> posting to /login returns a Session Cookie [2].
> 
> Bmcweb also supports the /login api, which takes the same parameters,
> and returns the same data.  The only functional difference is that it
> implement CSRF prevention, which requires a second token to be issued
> along with the cookie, to avoid XSS and CSRF attacks.  This makes it
> incompatible in a minor way.  For testing, it's disableable through 
> the
> option BMCWEB_INSECURE_DISABLE_CSRF_PREVENTION.
> 
> In the bmcweb model, session information is shared across the whole
> application, so websocket, REST, KVM, and KVM sessions all share the
> same tokens and login mechanisms, which allows more compatibility with
> applications, and allows users to pick the login mechanism that works
> best for their application.
> 
>> Applications such as the phosphor-webui web application and xcat
>> currently use the Phosphor REST APIs, but will begin to use the 
>> Redfish
>> REST APIs, perhaps using both sets of APIs in the same application.
>> Will they need to login to both sets of REST APIs?
> In the "bmcweb is the only webserver" model, no, it wouldn't be 
> required to.
>> 
>> In this context, what is the plan to unify the authentication scheme?  
>> I
>> heard something about changing BMCWeb's version of the Phosphor REST
>> APIs so that when you post to /login, you get the same credentials as
>> from /redfish/v1/SessionService/Sessions.  Will I be able to login 
>> using
>> /login and use Redfish APIs, and vice-versa?
> 
> Already implemented, and has been for some time.
> 
> https://github.com/openbmc/bmcweb/blob/4ae611d9de1504b68f521e9837ddb97e0dc89d27/include/token_authorization_middleware.hpp#L274
> 
>> 
>> - Joseph
>> __________
>> 
>> [BMCWeb]: https://github.com/openbmc/bmcweb/blob/master/README.md
>> [nginx]: https://www.nginx.com/
>> [phosphor-webui]:
>> https://github.com/openbmc/phosphor-webui/blob/master/README.md
>> [xcat]: https://xcat.org/
>> [1]: https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt
>> [2]: https://github.com/openbmc/docs/blob/master/rest-api.md
>> [3]:
>> https://github.com/openbmc/meta-ibm/blob/master/recipes-httpd/nginx/files/nginx.conf
>> [4]: https://github.com/openbmc/phosphor-rest-server
>> [5]: https://gerrit.openbmc-project.xyz/#/q/project:openbmc/bmcweb
>> [6]:
>> https://gerrit.openbmc-project.xyz/#/q/project:openbmc/phosphor-objmgr
>> [7]:
>> https://github.com/openbmc/openbmc-test-automation/blob/master/README.md
>> [8]: https://github.com/openbmc/docs/blob/master/REDFISH-cheatsheet.md
>> 

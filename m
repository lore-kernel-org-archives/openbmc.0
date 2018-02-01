Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zXH5p0Wx1zDqkl
 for <openbmc@lists.ozlabs.org>; Thu,  1 Feb 2018 21:53:17 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w11Ancbv089206
 for <openbmc@lists.ozlabs.org>; Thu, 1 Feb 2018 05:53:14 -0500
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2fuxyvq2gk-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 01 Feb 2018 05:53:13 -0500
Received: from localhost
 by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Thu, 1 Feb 2018 10:53:12 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp15.uk.ibm.com (192.168.101.145) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 1 Feb 2018 10:53:10 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w11Ar42N50135146; Thu, 1 Feb 2018 10:53:04 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B45A4AE16A;
 Thu,  1 Feb 2018 10:44:27 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B7BAAE177;
 Thu,  1 Feb 2018 10:44:26 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.203.113])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Feb 2018 10:44:25 +0000 (GMT)
Subject: Re: Redfish on OpenBMC
To: Michael.E.Brown@dell.com, hramasub@in.ibm.com
References: <9FBE92B9-4D49-41CD-9AF7-A5A9E48B25F3@fuzziesquirrel.com>
 <c62f69455ae74650a086a167c7434d37@ausx13mps334.AMER.DELL.COM>
 <OFF0C73A52.E22304BC-ON65258227.0026CCEB-65258227.0032425A@notes.na.collabserv.com>
Cc: openbmc@lists.ozlabs.org
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Thu, 1 Feb 2018 16:23:01 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:52.0)
 Gecko/20100101 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <OFF0C73A52.E22304BC-ON65258227.0026CCEB-65258227.0032425A@notes.na.collabserv.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18020110-0020-0000-0000-000003F136EC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18020110-0021-0000-0000-000042839FC4
Message-Id: <cc30ee65-2fb7-ddd2-b6af-11d665919be6@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-01_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802010142
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Feb 2018 10:53:18 -0000

On 01/02/18 2:38 pm, Hariharasubramanian Ramasubramanian wrote:
> Hi Michael,
> 
> Thanks for enumerating the attributes for comparison.
> 
> I want to list down a few additional criteria that may be evaluated:
> 
> 1) Data-Driven Resource Discovery:
> - The Redfish server should ideally build it's resource model from a 
> "config file". This config file could potentially be hand-coded or built 
> out of a "system definition file". The following are examples of system 
> definition files for 2 of the systems currently running OpenBMC firmware.
> https://raw.githubusercontent.com/open-power/zaius-xml/master/zaius.xml
> https://raw.githubusercontent.com/open-power/witherspoon-xml/master/witherspoon.xml
> The system architecture (sled vs blade etc.), number of processors, 
> number of fans etc. can be determined from the system definition file to 
> generate the config file.

OpenBMC systems already have a "resource model" in the form of the D-Bus 
object hierarchy. Do you envision having a separate model to depict the 
Redfish hypermedia resources, or coming up with a way to map Redfish 
resources to D-Bus objects? This probably ties into the point about how 
easy it is to take the implementation and run it outside OpenBMC.

> The intent is to make the redfish implementation as system agnostic as 
> possible.
> 
> 2) Separation of the Redfish front-end (view) and back-end 
> (infrastructure) layers. The infrastructure API exposed as dbus services 
> would be one of the means to make this separation of concerns.
> 
> 3) Performance :
> - Runtime memory foot print.This could potentially have a negative 
> impact on "how fast" the server is. Hence the trade-off should consider 
> what can be cached vs what needs to be queried from the infrastructure.
> - Michael, why did you consider SSL being separately implemented by the 
> Redfish server? Would this be in the scope of the webserver ?
> 
> 4) Eventing: Current version of the Redfish spec has left it open for 
> the OEMs to define the specific Event Messages. i.e. there is no 
> standard / common Event Registry. Redfish server implementation on the 
> OpenBMC should define this common Event Registry and perhaps accepted by 
> DMTF. Does the Eventing support filtering of events based on the event 
> type, source resource and the message Id ?
> 
> 5) Leverage existing open source projects:
> - Does the implementation compose existing services and frameworks ? 
> Such as a webserver(say, nginx) and a rest framework (flask).
> 
> regards,
> Hari !
> 
> 
> Inactive hide details for ---01/31/2018 10:17:36 PM---So, I think that 
> the first thing we ought to do is get a survey of the di---01/31/2018 
> 10:17:36 PM---So, I think that the first thing we ought to do is get a 
> survey of the different implementations tha
> 
> From: <Michael.E.Brown@dell.com>
> To: <bradleyb@fuzziesquirrel.com>
> Cc: <alirhas@microsoft.com>, <Balaji.B.Rao@dell.com>, 
> <Paul.Vancil@dell.com>, <ed.tanous@intel.com>, <rolfb@us.ibm.com>, 
> <jwcarman@us.ibm.com>, <hramasub@in.ibm.com>, <pradeep.kumar36@tcs.com>, 
> <openbmc@lists.ozlabs.org>
> Date: 01/31/2018 10:17 PM
> Subject: RE: Redfish on OpenBMC
> 
> ------------------------------------------------------------------------
> 
> 
> 
> So, I think that the first thing we ought to do is get a survey of the 
> different implementations that are out there, and establish criteria for 
> judging different implementations.
> 
> Here would be a list of questions I would have for everybody on the 
> list. I think it would probably be best to compile all of these into a 
> wiki page somewhere.
> 
>    - Do you have a redfish server implementation?
>    - Is it Open Source?
> - If not, are you planning on open sourcing it?
> - What is the license?
> - Is it posted to github or other public source control?
>    - Does it pass the DMTF redfish service validator?
>    - What language is it written in?
>    - How big is it?
>    - Can it be easily extended/re-used by anybody else shipping 
> compliant openbmc implementations?
> - Can you add OEM extensions to existing Redfish Resources without 
> "forking" the codebase?
> - Can you change the implementation for a single Redfish Resource 
> Property without forking?
> - Can you add new Redfish Resources without forking?
>    - Performance
> - How fast is it?
> - Does it implement SSL?
>    - Security
> - What is the security model?
> - Non-root support? Can it run as a non-privileged user?
> - Does it implement basic authentication and the redfish spec 
> x-auth-token authentication?
> - Does it implement the redfish standard privilege map model?
>    - Eventing:
> - For writing a UI on top of redfish, something like SSE is a 
> nice-to-have to avoid polling in the browser. There are a couple of 
> proposed SSE extensions that have not yet been approved.
> - How much work to implement SSE support to do things like watch 
> Property changes?
> - Is the standard redfish eventing model supported?
> - Security model integrated with eventing? Do eventing records get the 
> same security treatment as GET requests?
>    - Development: can it run outside of openbmc?
>    - Special sauce: is there anything not captured above that makes the 
> implementation special in any way?
> 
> --
> Michael
> 
> -----Original Message-----
> From: Brad Bishop [mailto:bradleyb@fuzziesquirrel.com]
> Sent: Tuesday, January 30, 2018 7:30 PM
> To: Brown, Michael E <Michael_E_Brown@Dell.com>
> Cc: alirhas@microsoft.com; Rao, Balaji B <Balaji_B_Rao@dell.com>; 
> Vancil, Paul <Paul_Vancil@Dell.com>; Tanous, Ed <ed.tanous@intel.com>; 
> rolfb@us.ibm.com; jwcarman@us.ibm.com; Hariharasubramanian 
> Ramasubramanian <hramasub@in.ibm.com>; pradeep.kumar36@tcs.com; OpenBMC 
> Maillist <openbmc@lists.ozlabs.org>
> Subject: Redfish on OpenBMC
> 
> Hi Michael
> 
> The project could really use someone to get everyone that has expressed 
> interest in the future of Redfish support in OpenBMC rowing in the same 
> direction.  So thank you for volunteering to lead that conversation at 
> the community call yesterday.
> 
> I’ve CC’ed everyone that I know of that has expressed an interest.
> OpenBMC community: feel free to speak up if you’d like to be involved 
> and I forgot you.
> 
> The only thing I’d ask is to please post links to any meetings, minutes, 
> or correspondence here on the list, so everyone can easily keep up with 
> how things are going or jump in to provide feedback.
> 
> thanks again
> 
> -brad
> 
> 
> 

Regards,
Deepak

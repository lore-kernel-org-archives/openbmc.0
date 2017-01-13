Return-Path: <dkodihal@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v0H274QJ9zDqS4
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 20:11:59 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 v0D98ofL033621
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 04:11:57 -0500
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 by mx0b-001b2d01.pphosted.com with ESMTP id 27xsv4cehj-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 04:11:56 -0500
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Fri, 13 Jan 2017 19:11:53 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 13 Jan 2017 19:11:52 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 24CB33578053
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 20:11:52 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0D9Bq6q32702698
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 20:11:52 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v0D9Bq8w021299
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 20:11:52 +1100
Received: from Deepaks-MacBook-Pro.local ([9.193.119.48])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v0D9Bo6b021267
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 20:11:51 +1100
Subject: Re: RFC: new design of phosphor-time-manager on sdbusplus
To: openbmc@lists.ozlabs.org
References: <CAARXrtkPMixp9M0SYyaeP4_j83mRRXNG1O2Tf24rL5OH6CbJvg@mail.gmail.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Fri, 13 Jan 2017 14:41:49 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:45.0)
 Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAARXrtkPMixp9M0SYyaeP4_j83mRRXNG1O2Tf24rL5OH6CbJvg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17011309-0044-0000-0000-0000021C6909
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17011309-0045-0000-0000-0000065900CD
Message-Id: <7248ccf6-226b-0a7f-162a-72bd307c2bca@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-13_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701130131
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jan 2017 09:12:00 -0000

Hello Lei,


On 13/01/17 1:12 pm, Mine wrote:
> I’d like to discuss the design of |phosphor-time-manager| with the new
> sdbusplus interfaces.
>
> Please see below background and new design, let me know if you have any
> comments.
> Thanks!
>
>
>       Background
>
> Legacy time-manager expose below interfaces and methods:
>
>   * curr_time_mode
>   * curr_time_owner
>   * requested_time_mode
>   * requested_time_owner
>   * GetTime(target)
>   * SetTime(target, time)
>
> The implementation of |Get/SetTime()| will check the current time mode
> and owner, and do below:
>
>   * For |GetTime(<target>)|:
>       o If target is “bmc”, return BMC time;
>       o If target is “host”, return Host time;
>       o Else, return error
>   * For |SetTime(target, time)|:
>       o If target is “bmc”:
>           + If mode is NTP, return error
>           + If owner is “HOST”, return error
>           + Set BMC time
>       o If target is “host”:
>           + If owner is “BMC”, return error
>           + Set Host time
>           + If owner is “SPLIT”, save the diff between BMC time and Host
>             time;
>
>
>       New Design
>
> Now with sdbusplus, we have EpochTime interface, with |elapsed| property.
>
> After discussion with Li Yi and Vishwa, we decided to implement as below:
>
> Create two objects:
>
>   * |BmcEpoch|
>   * |HostEpoch|


Could these be just associations (via the association interface) to a 
single object? I'm not sure if the user the Epoch interface knows Host 
vs BMC? Shouldn't that be picked from the settings, or do we really have 
explicit calls to fetch/set bmc and host time?

> They both implements EpochTime interface.
>
> For |BmcEpoch|:
>
>   * When |elapsed()| is called, return BMC time;
>   * When |elapsed(us)| is called, use above SetTime(“bmc”) logic
>
> For |HostEpoch|:
>
>   * When |elapsed()| is called, return HOST time;
>   * When |elapsed(us)| is called, use above SetTime(“host”) logic.
>
> And there will be no “curr_time_mode/owner” or
> “requested_time_mode/owner” properties on DBUS.
>
> --
> BRs,
> Lei YU

Regards,
Deepak

>
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>

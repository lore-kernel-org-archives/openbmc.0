Return-Path: <vishwa@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v3PN36PJCzDqFW
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2017 22:08:19 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v0IB3iwV045200
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2017 06:08:16 -0500
Received: from e28smtp02.in.ibm.com (e28smtp02.in.ibm.com [125.16.236.2])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2824xudm1m-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2017 06:08:16 -0500
Received: from localhost
 by e28smtp02.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Wed, 18 Jan 2017 16:38:11 +0530
Received: from d28dlp02.in.ibm.com (9.184.220.127)
 by e28smtp02.in.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 18 Jan 2017 16:38:09 +0530
Received: from d28relay07.in.ibm.com (d28relay07.in.ibm.com [9.184.220.158])
 by d28dlp02.in.ibm.com (Postfix) with ESMTP id 7E7E53940066
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2017 16:38:08 +0530 (IST)
Received: from d28av03.in.ibm.com (d28av03.in.ibm.com [9.184.220.65])
 by d28relay07.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0IB7H5t28115112
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2017 16:37:17 +0530
Received: from d28av03.in.ibm.com (localhost [127.0.0.1])
 by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v0IB87VX013278
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2017 16:38:07 +0530
Received: from [9.199.66.245] ([9.199.66.245])
 by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v0IB81MF012982; Wed, 18 Jan 2017 16:38:02 +0530
Subject: Re: RFC: new design of phosphor-time-manager on sdbusplus
To: Mine <mine260309@gmail.com>, Patrick Williams <patrick@stwcx.xyz>
References: <CAARXrtkPMixp9M0SYyaeP4_j83mRRXNG1O2Tf24rL5OH6CbJvg@mail.gmail.com>
 <20170116194447.d3yzsldsu3qsl5sz@asimov>
 <CAARXrtnHD0s=dMKJwy_XqJ==cpamDiVPn8c4K=+ZPso1d0gSBg@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Wed, 18 Jan 2017 16:37:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAARXrtnHD0s=dMKJwy_XqJ==cpamDiVPn8c4K=+ZPso1d0gSBg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17011811-0004-0000-0000-0000052951ED
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17011811-0005-0000-0000-0000132235AB
Message-Id: <3c0b4208-9e8f-12c7-39a9-749a68d2b788@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-18_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701180156
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
X-List-Received-Date: Wed, 18 Jan 2017 11:08:20 -0000

On 01/17/2017 01:21 PM, Mine wrote:
> Hi Patrick,
>
> On Tue, Jan 17, 2017 at 3:44 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
>> On Fri, Jan 13, 2017 at 03:42:50PM +0800, Mine wrote:
>>> New Design
>>>
>>> Create two objects:
>> You mean 'classes' or 'objects'?  I think you mean two classes, which
>> initially we will only have 1 instance of each.  Please make sure the
>> HostEpoch implementation can relatively-easily be enhanced to have
>> multiple instances.
> I should be meant to create two "instances" on the bus, eventually it looks
> something like:
> ```
> xyz.openbmc_project.Time.Manager
>      /xyz/openbmc_project/time/host_epoch
>          org.freedesktop.DBus.Peer
>          org.freedesktop.DBus.Introspectable
>          org.freedesktop.DBus.Properties
>          xyz.openbmc_project.Time.EpochTime
>      /xyz/openbmc_project/time/bmc_epoch
>          org.freedesktop.DBus.Peer
>          org.freedesktop.DBus.Introspectable
>          org.freedesktop.DBus.Properties
>          xyz.openbmc_project.Time.EpochTime
>
> ```
> The service's BUSNAME is still `xyz.openbmc_project.Time.Manager`, and
> it creates two objects, one for BmcEpoch and the other for HostEpoch, who
> both implement xyz.openbmc_project.Time.EpochTime interface.
So TimeManager still owns the responsibility of maintaining offsets etc 
right ?
>>>     - BmcEpoch
>>>     - HostEpoch
>>>
>>> They both implements EpochTime interface.
>>>
>>> For BmcEpoch:
>>>
>>>     - When elapsed() is called, return BMC time;
>>>     - When elapsed(us) is called, use above SetTime(“bmc”) logic
>>>
>>> For HostEpoch:
>>>
>>>     - When elapsed() is called, return HOST time;
>>>     - When elapsed(us) is called, use above SetTime(“host”) logic.
>> Seems ok.
>>
>> The errors also need to be converted to dbus-defined errors, right?
>>
>>> And there will be no “curr_time_mode/owner” or “requested_time_mode/owner”
>>> properties on DBUS.
>> So these are only stored in phosphor-settingsd now or are they also used
>> internally for decisions?  I believe the previous implementation had
>> them exposed more for debug purposes.  Are you going to add them to the
>> journal at least?
> Yes, the time_mode and time_owner are still stored in
> phosphor-settingsd, and they
> are used internally by phosphor-time-manager, which will register
> callback for the
> settings' change and handled accordingly.
> The difference from the previous implementation is that we do not expose these
> settings in time-manager's DBus now.
>
> What do you mean by "add them to the journal"?
I believe he is asking you to put that information in the journal traces 
so that we can use them for debug. I think you don't need anything more 
to cater to that request as the original implementation already puts 
those as journal traces.
>
>> --
>> Patrick Williams
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

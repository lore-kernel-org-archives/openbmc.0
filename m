Return-Path: <vishwa@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v431x5gl3zDqGp
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 23:24:53 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v0JCOPRq110217
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 07:24:51 -0500
Received: from e28smtp04.in.ibm.com (e28smtp04.in.ibm.com [125.16.236.4])
 by mx0b-001b2d01.pphosted.com with ESMTP id 282w1fh21q-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 07:24:51 -0500
Received: from localhost
 by e28smtp04.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Thu, 19 Jan 2017 17:54:47 +0530
Received: from d28dlp02.in.ibm.com (9.184.220.127)
 by e28smtp04.in.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 19 Jan 2017 17:54:45 +0530
Received: from d28relay05.in.ibm.com (d28relay05.in.ibm.com [9.184.220.62])
 by d28dlp02.in.ibm.com (Postfix) with ESMTP id AAD863940061
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 17:54:44 +0530 (IST)
Received: from d28av03.in.ibm.com (d28av03.in.ibm.com [9.184.220.65])
 by d28relay05.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0JCOgJf38141954
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 17:54:43 +0530
Received: from d28av03.in.ibm.com (localhost [127.0.0.1])
 by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v0JCOhfu016100
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 17:54:43 +0530
Received: from [9.199.66.245] ([9.199.66.245])
 by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v0JCOhh2016093; Thu, 19 Jan 2017 17:54:43 +0530
From: vishwa <vishwa@linux.vnet.ibm.com>
Subject: Re: RFC: new design of phosphor-time-manager on sdbusplus
To: Patrick Williams <patrick@stwcx.xyz>, Mine <mine260309@gmail.com>
References: <CAARXrtkPMixp9M0SYyaeP4_j83mRRXNG1O2Tf24rL5OH6CbJvg@mail.gmail.com>
 <20170116194447.d3yzsldsu3qsl5sz@asimov>
 <CAARXrtnHD0s=dMKJwy_XqJ==cpamDiVPn8c4K=+ZPso1d0gSBg@mail.gmail.com>
 <20170118144408.GA5120@heinlein.lan>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 19 Jan 2017 17:54:43 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170118144408.GA5120@heinlein.lan>
Content-Type: multipart/alternative;
 boundary="------------CEBA81E59D0DCD66C55772A0"
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17011912-0012-0000-0000-000003A70353
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17011912-0013-0000-0000-00001B273762
Message-Id: <d12112ca-8f13-0209-a1d3-2f009db441e7@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-19_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701190172
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
X-List-Received-Date: Thu, 19 Jan 2017 12:24:54 -0000

This is a multi-part message in MIME format.
--------------CEBA81E59D0DCD66C55772A0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/18/2017 08:14 PM, Patrick Williams wrote:
> On Tue, Jan 17, 2017 at 03:51:39PM +0800, Mine wrote:
>> On Tue, Jan 17, 2017 at 3:44 AM, Patrick Williams<patrick@stwcx.xyz>  wrote:
>>> On Fri, Jan 13, 2017 at 03:42:50PM +0800, Mine wrote:
>> I should be meant to create two "instances" on the bus, eventually it looks
>> something like:
>> ```
>> xyz.openbmc_project.Time.Manager
>>      /xyz/openbmc_project/time/host_epoch
>>          org.freedesktop.DBus.Peer
>>          org.freedesktop.DBus.Introspectable
>>          org.freedesktop.DBus.Properties
>>          xyz.openbmc_project.Time.EpochTime
>>      /xyz/openbmc_project/time/bmc_epoch
>>          org.freedesktop.DBus.Peer
>>          org.freedesktop.DBus.Introspectable
>>          org.freedesktop.DBus.Properties
>>          xyz.openbmc_project.Time.EpochTime
> There isn't a reason to name the object path "epoch".  /time/bmc and
> /time/host0 is probably more appropriate.
>
>>>> And there will be no “curr_time_mode/owner” or “requested_time_mode/owner”
>>>> properties on DBUS.
>>> So these are only stored in phosphor-settingsd now or are they also used
>>> internally for decisions?  I believe the previous implementation had
>>> them exposed more for debug purposes.  Are you going to add them to the
>>> journal at least?
>> Yes, the time_mode and time_owner are still stored in
>> phosphor-settingsd, and they
>> are used internally by phosphor-time-manager, which will register
>> callback for the
>> settings' change and handled accordingly.
>> The difference from the previous implementation is that we do not expose these
>> settings in time-manager's DBus now.
> There are two aspects for consideration here:
>
>      1. The current time manager defers changing the host policies until
>         the next boot.  We need to continue this behavior.
There was a concern from test team on 'why do we need to defer applying 
any settings that are used by time manager'.

I thought and partially agree to their concern. For changing the owner 
*away from SPLIT*, we can actually consume that readily. Its only the 
change * TO SPLIT* that needs to delayed until off.

Also, the time_mode changes can be applied readily ( although time 
manager may not like HOST and NTP and in that case, its in pending state 
anyway ).


>      2. If the process restarts we need it to go back into the "current
>         state" and not the "requested state".  How do we make this
>         happen?  The current implementation might also have a flaw here
>         so maybe we log it as an issue for follow up.


The current implementation only sets the values based on what was set 
prior to reset.
It does that by consuming the saved data in /var/lib/obmc/saved_*. So 
there is not an issue there.


>> What do you mean by "add them to the journal"?
> Use phosphor-logging.
>
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc


--------------CEBA81E59D0DCD66C55772A0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 01/18/2017 08:14 PM, Patrick Williams wrote:<br>
    <blockquote cite="mid:20170118144408.GA5120@heinlein.lan"
      type="cite">
      <pre wrap="">On Tue, Jan 17, 2017 at 03:51:39PM +0800, Mine wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">On Tue, Jan 17, 2017 at 3:44 AM, Patrick Williams <a class="moz-txt-link-rfc2396E" href="mailto:patrick@stwcx.xyz">&lt;patrick@stwcx.xyz&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">On Fri, Jan 13, 2017 at 03:42:50PM +0800, Mine wrote:
</pre>
        </blockquote>
      </blockquote>
      <blockquote type="cite">
        <pre wrap="">I should be meant to create two "instances" on the bus, eventually it looks
something like:
```
xyz.openbmc_project.Time.Manager
    /xyz/openbmc_project/time/host_epoch
        org.freedesktop.DBus.Peer
        org.freedesktop.DBus.Introspectable
        org.freedesktop.DBus.Properties
        xyz.openbmc_project.Time.EpochTime
    /xyz/openbmc_project/time/bmc_epoch
        org.freedesktop.DBus.Peer
        org.freedesktop.DBus.Introspectable
        org.freedesktop.DBus.Properties
        xyz.openbmc_project.Time.EpochTime
</pre>
      </blockquote>
      <pre wrap="">There isn't a reason to name the object path "epoch".  /time/bmc and
/time/host0 is probably more appropriate.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="">And there will be no “curr_time_mode/owner” or “requested_time_mode/owner”
properties on DBUS.
</pre>
          </blockquote>
          <pre wrap="">So these are only stored in phosphor-settingsd now or are they also used
internally for decisions?  I believe the previous implementation had
them exposed more for debug purposes.  Are you going to add them to the
journal at least?
</pre>
        </blockquote>
        <pre wrap="">Yes, the time_mode and time_owner are still stored in
phosphor-settingsd, and they
are used internally by phosphor-time-manager, which will register
callback for the
settings' change and handled accordingly.
The difference from the previous implementation is that we do not expose these
settings in time-manager's DBus now.
</pre>
      </blockquote>
      <pre wrap="">There are two aspects for consideration here:

    1. The current time manager defers changing the host policies until
       the next boot.  We need to continue this behavior.</pre>
    </blockquote>
    There was a concern from test team on 'why do we need to defer
    applying any settings that are used by time manager'.<br>
    <br>
    I thought and partially agree to their concern. For changing the
    owner *away from SPLIT*, we can actually consume that readily. Its
    only the change * TO SPLIT* that needs to delayed until off.<br>
    <br>
    Also, the time_mode changes can be applied readily ( although time
    manager may not like HOST and NTP and in that case, its in pending
    state anyway ).<br>
    <br>
    <br>
    <blockquote cite="mid:20170118144408.GA5120@heinlein.lan"
      type="cite">
      <pre wrap="">
    2. If the process restarts we need it to go back into the "current
       state" and not the "requested state".  How do we make this
       happen?  The current implementation might also have a flaw here
       so maybe we log it as an issue for follow up.</pre>
    </blockquote>
    <br>
    <br>
    The current implementation only sets the values based on what was
    set prior to reset.<br>
    It does that by consuming the saved data in /var/lib/obmc/saved_*.
    So there is not an issue there.<br>
    <br>
    <br>
    <blockquote cite="mid:20170118144408.GA5120@heinlein.lan"
      type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">What do you mean by "add them to the journal"?
</pre>
      </blockquote>
      <pre wrap="">Use phosphor-logging.

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
openbmc mailing list
<a class="moz-txt-link-abbreviated" href="mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>
<a class="moz-txt-link-freetext" href="https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------CEBA81E59D0DCD66C55772A0--

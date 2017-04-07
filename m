Return-Path: <vishwa@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vzqjZ1wc6zDqK7
 for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2017 16:41:22 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v376ddB7094192
 for <openbmc@lists.ozlabs.org>; Fri, 7 Apr 2017 02:41:09 -0400
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 by mx0b-001b2d01.pphosted.com with ESMTP id 29p3dc6r4h-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 07 Apr 2017 02:41:09 -0400
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Fri, 7 Apr 2017 16:41:06 +1000
Received: from d23relay09.au.ibm.com (202.81.31.228)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 7 Apr 2017 16:41:04 +1000
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v376etXP32964656
 for <openbmc@lists.ozlabs.org>; Fri, 7 Apr 2017 16:41:03 +1000
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v376eVEl029836
 for <openbmc@lists.ozlabs.org>; Fri, 7 Apr 2017 16:40:31 +1000
Received: from [9.202.7.27] ([9.202.7.27])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v376eU2I029671; Fri, 7 Apr 2017 16:40:30 +1000
Subject: Re: Discussion on GPIO monitoring and design thoughts.
To: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <3ca9e8a5-4135-8fa3-cbf5-62543a89a491@linux.vnet.ibm.com>
 <1491524060.5817.8.camel@aj.id.au>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Fri, 7 Apr 2017 12:11:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1491524060.5817.8.camel@aj.id.au>
Content-Type: multipart/alternative;
 boundary="------------305C4836201C6A464A87E1AF"
X-TM-AS-MML: disable
x-cbid: 17040706-0040-0000-0000-000003053F78
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17040706-0041-0000-0000-00000C7C83E0
Message-Id: <7459b361-8c6f-aeb8-e434-f3725549adf3@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-07_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1704070060
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
X-List-Received-Date: Fri, 07 Apr 2017 06:41:22 -0000

This is a multi-part message in MIME format.
--------------305C4836201C6A464A87E1AF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

Thanks for the feedback. I have responded inline.

On 04/07/2017 05:44 AM, Andrew Jeffery wrote:
> Hi Vishwa,
>
> I have some queries below. Apologies if they appear curt, but I'm
> trying to cut to the point in each case.
>
> On Wed, 2017-04-05 at 13:56 +0530, vishwa wrote:
>> We had a technical discussion on HOWTO and what is the right thing to do
>> handling the GPIO assertion and here is the gist.
>>
>> 1) Use gpio-keys and utilize libevdev wrappers (
>> https://www.freedesktop.org/software/libevdev/doc/latest/ ) to watch for
>> data in /dev/input/event.
> Okay, I'd like you to step back and detail what problem you're actually
> trying to solve here. Going from wanting to handle GPIO interrupts to
> using gpio-keys everywhere needs some explanation. We have at least two
> other interfaces that would appear to be sufficient: GPIO chardev and
> sysfs.

Sure. I realize I should have put the use-case here than at the end.

Problem: When the host check-stops, we need a way to detect that.
The existing mechanism will assert a configured GPIO when that happens.
Firmware code needs a way of knowing that it has happened and that is 
why this application.

I was told that /sysfs is being deprecated and that we use the chardev. 
We had 2 options then.

1/. Use the gpio-keys
2/. Use libgpio ( the support is not in yet in 4.7 per the discussion )

Brad Bishop recommended that gpio-keys be used over libgpio due to the 
debouncing support built into gpio-keys implementation.
Since I am not an expert in this area, I suggest you please talk to Brad 
if you see there are better ideas.
> What you've described reads to me like a case of the X-Y problem. This
> link is rather blunt, but it illustrates the issue:
>
> http://mywiki.wooledge.org/XyProblem

This link is really hilarious ( yeah ), Thanks for this :)

>> 2) Define a target with set of services that would be called into by the
>> GPIO monitor application when the GPIO state changes to what is expected.
>>
>>    - 2.1) Another option was to just broadcast a signal that interested
>> parties could catch and act
> I assume this is on D-Bus?

Correct.

>
>>   but then it was not chosen because there
>> would be no guarantee that the signal would ever be delivered / caught
>> by needed parties.
> Isn't this what systemd is for?

It was Patrick's concern on using signals. But I tend to agree with him 
too. Although I understand systemd is already doing a good job here with 
signals.
>
> Isn't this what you gain by decoupling the monitoring from the
> handling? For instance if we're talking in abstract terms, the current
> system policy might be to not care about the state change.

Yeah. This is a valid one. We shall talk about it.

>>    - 2.2 ) Also going the signal way demands a service that just needs to
>> watch for that.
> Is that the case? Can't we have one service handling multiple signals?
> Whether that's a good idea is another question.
>

I don't like the idea of one jumbo application monitoring all signals. 
Whoever that has a need, let them wait.

>> *) The services that are part of the target will then own complete
>> handling of the condition instead of the application that monitored the
>> GPIO.
> Why are we decoupling the handler services from the GPIO? What is the
> advantage?
>
> The disadvantage is the behaviour of the system is much harder to
> understand. If we go this route, what tooling will be in place to debug
> failures of interactions between components?
>
> I would argue that this is already a significant hurdle in
> understanding integration failures on the BMC, and I would prefer not
> to add to the problems.
>

I am not following the argument here. Why is the behavior harder to 
understand when you have defined systemd targets doing what they are
required to do. Its the job of applications that get into that target to 
do the right thing of collecting what is necessary to understand
one specific problem.
>> ---------
>>
>> Here is an example of application that handles the GPIO assertion that
>> happens when host does a checkstop.
>>
>> 1) Application's arguments need /dev/input/event<$number> and the
>> expected GPIO state as indicated by linux,code in :
>>
>> http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/input/gpio-keys.txt
> There is a downside in that you will be creating a kernel ABI by
> mapping GPIO events to a keycode. This choice appears to me to be
> arbitrary, and from the kernel's perspective we don't know how
> userspace is going to treat the value so we lose the flexibility to
> change it if it's not. This isn't a show-stopper, but it sure feels
> like a wart that doesn't need to exist.
>

Is it not expected that the binding always pass the input_event struct 
?. What kind of changes are you thinking ?

Are you saying for instance you will change these values and 
applications may go crazy ?

|#define KEY_UP 103 ||#define KEY_DOWN 108 |


>> 2) Call this app after reaching `Host-Running` state thus avoiding any
>> checks to see current state.
>>
>> 2) App will then use libevdev wrappers to watch for the state
> It bothers me that we'd be invoking libevdev to catch an interrupt on a
> GPIO. It seems unnecessarily complex in general.

I need Brad Bishop help here.

>
>> 3) On seeing the expected state change, app calls into the configured
>> target.
>>
>> 4) Configured target right now has 2 services.
>>
>>     - 4.1 ) Service that Creates an errorlog indicating the checkstop
>>     - 4.2 ) Service that will start the Quiesce target
>>
>> --------
>>
>> This design direction helps decouple applications that monitor and
>> analyze the conditions.
> Sure. But you need to describe the advantage of decoupling these
> concepts. Why do we need the abstraction? I need something more than
> "decoupling is good", because as described above it can lead to a lot
> of overhead trying to track down bugs. Sometimes it's a balancing act,
> and we need to understand what we're trading off.

Sure. The advantage of decoupling is that you can use this gpio monitor 
in any implementation and offloading handling the errors to 
implementation specific targets than consuming implementation specific 
complexity into this code and thus making it specific to some platforms.

> Cheers,
>
> Andrew

Hope I answered. Thank you.

!! Vishwa !!

--------------305C4836201C6A464A87E1AF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>Hi Andrew,</p>
    <p>Thanks for the feedback. I have responded inline.<br>
    </p>
    <div class="moz-cite-prefix">On 04/07/2017 05:44 AM, Andrew Jeffery
      wrote:<br>
    </div>
    <blockquote cite="mid:1491524060.5817.8.camel@aj.id.au" type="cite">
      <pre wrap="">Hi Vishwa,

I have some queries below. Apologies if they appear curt, but I'm
trying to cut to the point in each case.

On Wed, 2017-04-05 at 13:56 +0530, vishwa wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">We had a technical discussion on HOWTO and what is the right thing to do 
handling the GPIO assertion and here is the gist.

1) Use gpio-keys and utilize libevdev wrappers ( 
<a class="moz-txt-link-freetext" href="https://www.freedesktop.org/software/libevdev/doc/latest/">https://www.freedesktop.org/software/libevdev/doc/latest/</a> ) to watch for 
data in /dev/input/event.
</pre>
      </blockquote>
      <pre wrap="">
Okay, I'd like you to step back and detail what problem you're actually
trying to solve here. Going from wanting to handle GPIO interrupts to
using gpio-keys everywhere needs some explanation. We have at least two
other interfaces that would appear to be sufficient: GPIO chardev and
sysfs.
</pre>
    </blockquote>
    <br>
    Sure. I realize I should have put the use-case here than at the end.<br>
    <br>
    Problem: When the host check-stops, we need a way to detect that. <br>
    The existing mechanism will assert a configured GPIO when that
    happens.<br>
    Firmware code needs a way of knowing that it has happened and that
    is why this application.<br>
    <br>
    I was told that /sysfs is being deprecated and that we use the
    chardev. We had 2 options then.<br>
    <br>
    1/. Use the gpio-keys <br>
    2/. Use libgpio ( the support is not in yet in 4.7 per the
    discussion )<br>
    <br>
    Brad Bishop recommended that gpio-keys be used over libgpio due to
    the debouncing support built into gpio-keys implementation.<br>
    Since I am not an expert in this area, I suggest you please talk to
    Brad if you see there are better ideas.<br>
    <blockquote cite="mid:1491524060.5817.8.camel@aj.id.au" type="cite">
      <pre wrap="">
What you've described reads to me like a case of the X-Y problem. This
link is rather blunt, but it illustrates the issue: 

<a class="moz-txt-link-freetext" href="http://mywiki.wooledge.org/XyProblem">http://mywiki.wooledge.org/XyProblem</a>
</pre>
    </blockquote>
    <br>
    This link is really hilarious ( yeah ), Thanks for this :)<br>
    <br>
    <blockquote cite="mid:1491524060.5817.8.camel@aj.id.au" type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">
2) Define a target with set of services that would be called into by the 
GPIO monitor application when the GPIO state changes to what is expected.

  - 2.1) Another option was to just broadcast a signal that interested 
parties could catch and act
</pre>
      </blockquote>
      <pre wrap="">
I assume this is on D-Bus?</pre>
    </blockquote>
    <br>
    Correct.<br>
    <br>
    <blockquote cite="mid:1491524060.5817.8.camel@aj.id.au" type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap=""> but then it was not chosen because there 
would be no guarantee that the signal would ever be delivered / caught 
by needed parties.
</pre>
      </blockquote>
      <pre wrap="">
Isn't this what systemd is for?</pre>
    </blockquote>
    <br>
    It was Patrick's concern on using signals. But I tend to agree with
    him too. Although I understand systemd is already doing a good job
    here with signals.<br>
    <blockquote cite="mid:1491524060.5817.8.camel@aj.id.au" type="cite">
      <pre wrap="">

Isn't this what you gain by decoupling the monitoring from the
handling? For instance if we're talking in abstract terms, the current
system policy might be to not care about the state change.
</pre>
    </blockquote>
    <br>
    Yeah. This is a valid one. We shall talk about it.<br>
    <br>
    <blockquote cite="mid:1491524060.5817.8.camel@aj.id.au" type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">
  - 2.2 ) Also going the signal way demands a service that just needs to 
watch for that.
</pre>
      </blockquote>
      <pre wrap="">
Is that the case? Can't we have one service handling multiple signals?
Whether that's a good idea is another question.

</pre>
    </blockquote>
    <br>
    I don't like the idea of one jumbo application monitoring all
    signals. Whoever that has a need, let them wait.<br>
    <br>
    <blockquote cite="mid:1491524060.5817.8.camel@aj.id.au" type="cite">
      <blockquote type="cite">
        <pre wrap="">
*) The services that are part of the target will then own complete 
handling of the condition instead of the application that monitored the 
GPIO.
</pre>
      </blockquote>
      <pre wrap="">
Why are we decoupling the handler services from the GPIO? What is the
advantage?

The disadvantage is the behaviour of the system is much harder to
understand. If we go this route, what tooling will be in place to debug
failures of interactions between components?

I would argue that this is already a significant hurdle in
understanding integration failures on the BMC, and I would prefer not
to add to the problems.

</pre>
    </blockquote>
    <br>
    I am not following the argument here. Why is the behavior harder to
    understand when you have defined systemd targets doing what they are<br>
    required to do. Its the job of applications that get into that
    target to do the right thing of collecting what is necessary to
    understand<br>
    one specific problem.<br>
    <blockquote cite="mid:1491524060.5817.8.camel@aj.id.au" type="cite">
      <blockquote type="cite">
        <pre wrap="">
---------

Here is an example of application that handles the GPIO assertion that 
happens when host does a checkstop.

1) Application's arguments need /dev/input/event&lt;$number&gt; and the 
expected GPIO state as indicated by linux,code in :

<a class="moz-txt-link-freetext" href="http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/input/gpio-keys.txt">http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/input/gpio-keys.txt</a>
</pre>
      </blockquote>
      <pre wrap="">
There is a downside in that you will be creating a kernel ABI by
mapping GPIO events to a keycode. This choice appears to me to be
arbitrary, and from the kernel's perspective we don't know how
userspace is going to treat the value so we lose the flexibility to
change it if it's not. This isn't a show-stopper, but it sure feels
like a wart that doesn't need to exist.

</pre>
    </blockquote>
    <br>
    Is it not expected that the binding always pass the input_event
    struct ?. What kind of changes are you thinking ?<br>
    <br>
    Are you saying for instance you will change these values and
    applications may go crazy ?<br>
    <br>
    <pre><code><span class="hl ppc">#define KEY_UP			103
</span></code><code><span class="hl ppc">#define KEY_DOWN		108

</span></code></pre>
    <br>
    <blockquote cite="mid:1491524060.5817.8.camel@aj.id.au" type="cite">
      <blockquote type="cite">
        <pre wrap="">
2) Call this app after reaching `Host-Running` state thus avoiding any 
checks to see current state.

2) App will then use libevdev wrappers to watch for the state
</pre>
      </blockquote>
      <pre wrap="">
It bothers me that we'd be invoking libevdev to catch an interrupt on a
GPIO. It seems unnecessarily complex in general.</pre>
    </blockquote>
    <br>
    I need Brad Bishop help here.<br>
    <br>
    <blockquote cite="mid:1491524060.5817.8.camel@aj.id.au" type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">
3) On seeing the expected state change, app calls into the configured 
target.

4) Configured target right now has 2 services.

   - 4.1 ) Service that Creates an errorlog indicating the checkstop
   - 4.2 ) Service that will start the Quiesce target

--------

This design direction helps decouple applications that monitor and 
analyze the conditions.
</pre>
      </blockquote>
      <pre wrap="">
Sure. But you need to describe the advantage of decoupling these
concepts. Why do we need the abstraction? I need something more than
"decoupling is good", because as described above it can lead to a lot
of overhead trying to track down bugs. Sometimes it's a balancing act,
and we need to understand what we're trading off.
</pre>
    </blockquote>
    <br>
    Sure. The advantage of decoupling is that you can use this gpio
    monitor in any implementation and offloading handling the errors to
    implementation specific targets than consuming implementation
    specific complexity into this code and thus making it specific to
    some platforms.<br>
    <br>
    <blockquote cite="mid:1491524060.5817.8.camel@aj.id.au" type="cite">
      <pre wrap="">
Cheers,

Andrew</pre>
    </blockquote>
    <br>
    Hope I answered. Thank you.<br>
    <br>
    !! Vishwa !!<br>
  </body>
</html>

--------------305C4836201C6A464A87E1AF--

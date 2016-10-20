Return-Path: <ratagupt@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t09Lk1MLSzDvWt
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 00:55:41 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u9KDs7KD090160
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 09:55:40 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 266u9pn3ur-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 09:55:39 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Thu, 20 Oct 2016 07:55:38 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 20 Oct 2016 07:55:36 -0600
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 205691FF0029;
 Thu, 20 Oct 2016 07:55:16 -0600 (MDT)
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u9KDt16617039800; Thu, 20 Oct 2016 13:55:35 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BE4728067;
 Thu, 20 Oct 2016 09:55:35 -0400 (EDT)
Received: from [9.109.164.79] (unknown [9.109.164.79])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 366852803D;
 Thu, 20 Oct 2016 09:55:33 -0400 (EDT)
Subject: Re: RFC for enablement of slpd on openbmc
To: Patrick Williams <patrick@stwcx.xyz>
References: <5807B226.8090400@linux.vnet.ibm.com>
 <20161019213222.GG32710@heinlein.lan>
Cc: openbmc@lists.ozlabs.org
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Thu, 20 Oct 2016 19:25:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20161019213222.GG32710@heinlein.lan>
Content-Type: multipart/alternative;
 boundary="------------020302070507020404070707"
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102013-0012-0000-0000-000010EF1F48
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00005946; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000187; SDB=6.00770623; UDB=6.00369435; IPR=6.00547168; 
 BA=6.00004821; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013052; XFM=3.00000011;
 UTC=2016-10-20 13:55:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102013-0013-0000-0000-0000467908A2
Message-Id: <5808CCD4.301@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-20_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610200249
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
X-List-Received-Date: Thu, 20 Oct 2016 13:55:42 -0000

This is a multi-part message in MIME format.
--------------020302070507020404070707
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Patrick,

Thanks for giving the feedback,please find my comments inline.

Regards
Ratan Gupta

On Thursday 20 October 2016 03:02 AM, Patrick Williams wrote:
> On Wed, Oct 19, 2016 at 11:19:26PM +0530, Ratan Gupta wrote:
>> *Enabling SLP Server on openBMC*
>>
>> What is SLP
>>
>> =======
>>
>> Service Location Protocol (SLP) is a protocol that provides a framework
>> to allow networking applications to discover the existence, location,
>> and configuration of networked services in enterprise networks.
>>
>> openSLP is widely accepted in the industry
> What are the aspects of SLP that are requirements for the intended
> use-case?  SLP as a protocol has both direct query and an optional
> "directory" implementation that aggregates SLP results.  In your
> experience is that necessary or used?
   Slp supports three agents
      1) UA(slptool)
      2) SA(in our case it would be new app which we have to write for 
reg of services)
      3) DA(where the reg info stores) it could be on network or on the 
same machine..but it is required to support the RFC.

>
> What is the anticipated size footprint of using openSLP?  The RFC
> doesn't seem that significant, so if we do not need the directory aspect
> might it be more beneficial to write a small daemon ourself to give SLP
> responses rather than trying to mold openSLP to fit our needs?
    runtime foot print TOP Command shows
    214     1 daemon   S *3620*   3%   0% slpd -l /tmp/slpd.log  >>>3.5K
    file size which will take in flash
    slpd:- 100.4K
    libslp:-69.7K
>
> I'm certainly not advocating avoiding using existing open source.  But,
> with there not being an update to openSLP since 2013 and all the aspects
> we are going to have to work around below, I'm wondering on the benefit.
   I think we are not doing any workaround here,It is slp (as per the 
RFC)which expects
   IP in their reg url as the slp needs ip in the reg url,we are 
catering that need via de
>> What do we need to do?
>>
>> ==============
>>
>> 1) Bring SLP(OpenSLP) in image:- Write the bitbake recipe(didn't find
>> the readily available bitbake recipe)
>>
>> 2) Configure the services through Settings daemon.
> We do have a .bbclass for "registration" we need to ensure that this is
> utilized for SLP as much as possible.
> Yes we would be using it
>
> 3) Write the .service file as it needs to start after network is
> up(after networkd-online.target)
> This service file is for the openslp daemon, correct?
Yes

How to configure the services which needs to be registered with slpd

============================================

Option 1:- settingsd

Note: Gives the flexibility to change the configured services @ runtime.
Do we require this functionality?

Option 2:conf file for discovery services

Note: During build time we can get the service info(service-name,port)
from the existing infra(discoveryservice.bbclass)

> I don't entirely understand how these aren't phases of the same
> solution.
>
> The problem space as I see it:
>      1. An application provides a service to be advertised by SLP.
>      2. The application is currently started via a .service or a .socket
>         file.
>              a. Some services are always running.
>              b. Some services use socket-activation.
>      3. We need to register this service with the SLP daemon, somehow.
>
> Do we need to ensure the application is running (or available to run via
> socket activation) before we do the registration?  If the application is
> being restarted should we remove the registration and add it back after
> it comes back?
I believe that is not needed as the application(SA) would be dependent 
on the conf
      and out policy suggest that network services should restart always 
so it would be unnecessary
      to do reg and unreg
>
> You mentioned dealing with IP address changes.  It is pretty annoying
> that openSLP doesn't do this for you (a custom daemon could).  How are
> you handling multiple network interfaces?  How to we flag internal vs
> external interfaces?  Isn't there a mechanism via systemd (or networkd) to
> identify when the ip address changes?  Ideally, this would be a restart
> of a .service.
>
> I could see us building a very small application that performs three
> functions:
>      1. slp-register register <service>
>      2. slp-register deregister <service>
>      3. slp-register ip-change
>
> For each registered service "foo.service", we can generate
> foo-slp-register.service.  The foo-slp-register.service will depend on
> foo.service, so it is started immediately after and stopped when the
> foo.service is stopped.  The 'start' will be to call 'slp-register
> register'  and the 'stop' will be to call 'slp-register deregister'.
>
> We also can then keep off of something in systemd / networkd to run
> 'slp-register ip-change' whenever the IP changes.  This could either
> restart *-slp-register.service or it could extract all of the SLP
> registrations and update them with new IP addresses.  Putting all of the
> *-slp-register.service into a 'target' might make restarting them very
> simple.
>
> With this approach we do not need a long running application.
I agree but do we really need to dereg and reg in the case when the 
service is going down as.
     Our service policy is restart always whenever the network service 
goes down. so service would be down for a moment
     Long running application i was asking for the IP change event,I am 
not aware if systemd-networkd send some event
     whenever the ip change occurs.
>> How to register the services
>> ==================
>>
>> 1) Static Registration:- will not work as we need ip/host-name details
>> which we don't have @build time.
> It is unfortunate about this.  We can solve this with a custom
> slp-daemon.
Agree but the custom one would not be implementing the full RFC.
>
>> 2) Application(new DBUS app) will register the configured services to
>> the slpd on startup.
> I am not understanding what the 'dbus app' aspect of this would be.
> What would be the dbus interfaces?
   I thought of if some other app(netman.py) wants to do the reg and 
unreg. so thought of exposing the
       Register Service
       unregister Service
       Raising the DBUS signal in case of IP change.
>> We need to provide the dynamic registration support on BMC as IP of BMC
>> can change any time.  Registration of services with slpd takes the URL
>> of the service which includes ip and port of the service which needs to
>> be registered.
>>
>> Create a DBUS service application
>>
>> =====================
>>
>> 1) Once the service starts it registers the configured services with slpd.
>>
>> 2) listening on RTNETLINK event for ip change: raise a dbus signal(for
>> the IP change)
> Who is getting this signal?
    This one was required,if certain application is interested in IP 
change event then it can use.
    today no application is interested in this event.
>
>>        if there is IP change then dereg the old service followed by reg
>> service as the ip has changed.
>>
>> Regards
>> Ratan Gupta


--------------020302070507020404070707
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <small>Hi Patrick,<br>
      <br>
      Thanks for giving the feedback,please find my comments inline.<br>
      <br>
      Regards<br>
      Ratan Gupta</small><br>
    <br>
    <div class="moz-cite-prefix">On Thursday 20 October 2016 03:02 AM,
      Patrick Williams wrote:<br>
    </div>
    <blockquote cite="mid:20161019213222.GG32710@heinlein.lan"
      type="cite">
      <pre wrap="">On Wed, Oct 19, 2016 at 11:19:26PM +0530, Ratan Gupta wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">*Enabling SLP Server on openBMC*

What is SLP

=======

Service Location Protocol (SLP) is a protocol that provides a framework 
to allow networking applications to discover the existence, location, 
and configuration of networked services in enterprise networks.

openSLP is widely accepted in the industry
</pre>
      </blockquote>
      <pre wrap="">
What are the aspects of SLP that are requirements for the intended
use-case?  SLP as a protocol has both direct query and an optional
"directory" implementation that aggregates SLP results.  In your
experience is that necessary or used?</pre>
    </blockquote>
      <small>  Slp supports three agents<br>
           1) UA(slptool)<br>
           2) SA(in our case it would be new app which we have to write
      for reg of services)<br>
           3) DA(where the reg info stores) it could be on network or on
      the same machine..but it is required to support the RFC.<br>
          <br>
    </small>
    <blockquote cite="mid:20161019213222.GG32710@heinlein.lan"
      type="cite">
      <pre wrap="">

What is the anticipated size footprint of using openSLP?  The RFC
doesn't seem that significant, so if we do not need the directory aspect
might it be more beneficial to write a small daemon ourself to give SLP
responses rather than trying to mold openSLP to fit our needs?</pre>
    </blockquote>
    <small>   runtime foot print TOP Command shows   <br>
         214     1 daemon   S     <b>3620</b>   3%   0% slpd -l
      /tmp/slpd.log  &gt;&gt;&gt;3.5K<br>
         file size which will take in flash<br>
         slpd:- 100.4K<br>
         libslp:-69.7K<br>
    </small>
    <blockquote cite="mid:20161019213222.GG32710@heinlein.lan"
      type="cite">
      <pre wrap="">

I'm certainly not advocating avoiding using existing open source.  But,
with there not being an update to openSLP since 2013 and all the aspects
we are going to have to work around below, I'm wondering on the benefit.</pre>
    </blockquote>
    <small>  I think we are not doing any workaround here,It is slp (as
      per the RFC)which expects<br>
        IP in their reg url as the slp needs ip in the reg url,we are
      catering that need via de</small>
    <blockquote cite="mid:20161019213222.GG32710@heinlein.lan"
      type="cite">
      <blockquote type="cite">
        <pre wrap="">What do we need to do?

==============

1) Bring SLP(OpenSLP) in image:- Write the bitbake recipe(didn't find 
the readily available bitbake recipe)

2) Configure the services through Settings daemon.
</pre>
      </blockquote>
      <pre wrap="">
We do have a .bbclass for "registration" we need to ensure that this is
utilized for SLP as much as possible.
Yes we would be using it

3) Write the .service file as it needs to start after network is 
up(after networkd-online.target)
</pre>
      <pre wrap="">
This service file is for the openslp daemon, correct? </pre>
    </blockquote>
        <small>Yes</small>
    <pre wrap="">How to configure the services which needs to be registered with slpd

============================================

Option 1:- settingsd

Note: Gives the flexibility to change the configured services @ runtime. 
Do we require this functionality?

Option 2:conf file for discovery services

Note: During build time we can get the service info(service-name,port) 
from the existing infra(discoveryservice.bbclass)
</pre>
    <blockquote cite="mid:20161019213222.GG32710@heinlein.lan"
      type="cite">
      <pre wrap="">
I don't entirely understand how these aren't phases of the same
solution.

The problem space as I see it:
    1. An application provides a service to be advertised by SLP.
    2. The application is currently started via a .service or a .socket
       file.
            a. Some services are always running.
            b. Some services use socket-activation.
    3. We need to register this service with the SLP daemon, somehow.

Do we need to ensure the application is running (or available to run via
socket activation) before we do the registration?  If the application is
being restarted should we remove the registration and add it back after
it comes back?</pre>
    </blockquote>
      <small>I believe that is not needed as the application(SA) would
      be dependent on the conf<br>
           and out policy suggest that network services should restart
      always so it would be unnecessary <br>
           to do reg and unreg</small><br>
    <blockquote cite="mid:20161019213222.GG32710@heinlein.lan"
      type="cite">
      <pre wrap="">

You mentioned dealing with IP address changes.  It is pretty annoying
that openSLP doesn't do this for you (a custom daemon could).  How are
you handling multiple network interfaces?  How to we flag internal vs 
external interfaces?  Isn't there a mechanism via systemd (or networkd) to
identify when the ip address changes?  Ideally, this would be a restart
of a .service.

I could see us building a very small application that performs three
functions:
    1. slp-register register &lt;service&gt;
    2. slp-register deregister &lt;service&gt;
    3. slp-register ip-change

For each registered service "foo.service", we can generate
foo-slp-register.service.  The foo-slp-register.service will depend on
foo.service, so it is started immediately after and stopped when the
foo.service is stopped.  The 'start' will be to call 'slp-register
register'  and the 'stop' will be to call 'slp-register deregister'.

We also can then keep off of something in systemd / networkd to run 
'slp-register ip-change' whenever the IP changes.  This could either
restart *-slp-register.service or it could extract all of the SLP
registrations and update them with new IP addresses.  Putting all of the
*-slp-register.service into a 'target' might make restarting them very
simple.

With this approach we do not need a long running application.</pre>
    </blockquote>
       <small> I agree but do we really need to dereg and reg in the
      case when the service is going down as.<br>
          Our service policy is restart always whenever the network
      service goes down. so service would be down for a moment<br>
          Long running application i was asking for the IP change
      event,I am not aware if systemd-networkd send some event<br>
          whenever the ip change occurs.<br>
    </small>
    <blockquote cite="mid:20161019213222.GG32710@heinlein.lan"
      type="cite">
      <blockquote type="cite">
        <pre wrap="">How to register the services
==================

1) Static Registration:- will not work as we need ip/host-name details 
which we don't have @build time.
</pre>
      </blockquote>
      <pre wrap="">
It is unfortunate about this.  We can solve this with a custom
slp-daemon.</pre>
    </blockquote>
        <small>Agree but the custom one would not be implementing the
      full RFC.</small><br>
    <blockquote cite="mid:20161019213222.GG32710@heinlein.lan"
      type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">
2) Application(new DBUS app) will register the configured services to 
the slpd on startup.
</pre>
      </blockquote>
      <pre wrap="">
I am not understanding what the 'dbus app' aspect of this would be.
What would be the dbus interfaces?</pre>
    </blockquote>
       <small>  I thought of if some other app(netman.py) wants to do
      the reg and unreg. so thought of exposing the <br>
            Register Service<br>
            unregister Service<br>
            Raising the DBUS signal in case of IP change.</small><br>
    <blockquote cite="mid:20161019213222.GG32710@heinlein.lan"
      type="cite">
      <blockquote type="cite">
        <pre wrap="">We need to provide the dynamic registration support on BMC as IP of BMC 
can change any time.  Registration of services with slpd takes the URL 
of the service which includes ip and port of the service which needs to 
be registered.

Create a DBUS service application

=====================

1) Once the service starts it registers the configured services with slpd.

2) listening on RTNETLINK event for ip change: raise a dbus signal(for 
the IP change)
</pre>
      </blockquote>
      <pre wrap="">
Who is getting this signal?</pre>
    </blockquote>
    <small>   This one was required,if certain application is interested
      in IP change event then it can use.<br>
         today no application is interested in this event.</small><br>
    <blockquote cite="mid:20161019213222.GG32710@heinlein.lan"
      type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">
      if there is IP change then dereg the old service followed by reg 
service as the ip has changed.

Regards
Ratan Gupta
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------020302070507020404070707--

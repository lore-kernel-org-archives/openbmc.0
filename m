Return-Path: <joseph-reynolds@charter.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=charter.net
 (client-ip=68.114.190.31; helo=mtaout006-public.msg.strl.va.charter.net;
 envelope-from=joseph-reynolds@charter.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=charter.net
Received: from mtaout006-public.msg.strl.va.charter.net
 (mtaout006-public.msg.strl.va.charter.net [68.114.190.31])
 by lists.ozlabs.org (Postfix) with ESMTP id 40yNxY06QDzDrvG
 for <openbmc@lists.ozlabs.org>; Sat,  2 Jun 2018 11:33:03 +1000 (AEST)
Received: from impout002 ([68.114.189.17]) by mtaout006.msg.strl.va.charter.net
 (InterMail vM.9.00.023.01 201-2473-194) with ESMTP
 id <20180602013301.UIND7358.mtaout006.msg.strl.va.charter.net@impout002>
 for <openbmc@lists.ozlabs.org>; Fri, 1 Jun 2018 20:33:01 -0500
Received: from [192.168.2.15] ([97.86.254.207]) by impout002 with charter.net
 id tdZ11x00K4VFKzV01dZ1y2; Fri, 01 Jun 2018 20:33:01 -0500
X-Authority-Analysis: v=2.2 cv=C6eZ8UH+ c=1 sm=1 tr=0
 a=TxbYGM+zWkYih0pDanbSSw==:117 a=TxbYGM+zWkYih0pDanbSSw==:17
 a=x7bEGLp0ZPQA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=voM4FWlXAAAA:8 a=-c9VzbpeAAAA:8
 a=dpRSjrXKAAAA:8 a=Pk3kgetQdWdxlwS88nwA:9 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10
 a=NWVoK91CQyQA:10 a=EbfdsJ-0U3WKF7qJKekA:9 a=wR2-UI4rW09ZbfnK:21
 a=_W_S_7VecoQA:10 a=IC2XNlieTeVoXbcui8wp:22 a=WAq88MDkwfy8HpmZFCM0:22
 a=xkwab4zIHtOjTkBAMNFX:22
X-Auth-id: am9zZXBoLXJleW5vbGRzQGNoYXJ0ZXIubmV0
Subject: Re: Logging user actions - with an AAA service
To: openbmc@lists.ozlabs.org
References: <mailman.121.1527510407.18429.openbmc@lists.ozlabs.org>
From: Joseph Reynolds <joseph-reynolds@charter.net>
Message-ID: <c09c5499-d622-a797-5788-774aac17b7ea@charter.net>
Date: Fri, 1 Jun 2018 20:32:40 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <mailman.121.1527510407.18429.openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative;
 boundary="------------AAFF0B08B14E0AEAEF872933"
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Jun 2018 01:33:06 -0000

This is a multi-part message in MIME format.
--------------AAFF0B08B14E0AEAEF872933
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/28/2018 7:26 AM, openbmc-request@lists.ozlabs.org wrote:
> Message: 2
> Date: Mon, 28 May 2018 15:00:06 +0300
> From: Alexander Amelkin<a.amelkin@yadro.com>
> To:<openbmc@lists.ozlabs.org>
> Subject: Logging user actions
> Message-ID:<c0569989-b52d-745e-06fb-e92cbb1234c8@yadro.com>
> Content-Type: text/plain; charset="utf-8"
>
> Hi all!
>
> Customers ask us for extensive user action logging. That is, they want
> to log everything that a user may change in the system. They want to
> know who, how (via which interface) and when changed what. That includes
> but is not limited to network configuration, host power on/off, reboots,
> power restoration policy changing, firmware updates, user
> addition/deletion and password changing, et al.
>
> We could listen for dbus signals and log most of that, but that way we
> wouldn't know whether a user made a change or that was some internal
> work. Additionally, that would yield an enormous amount of data logged
> if we just log every property change. We could limit logging to a
> predefined subset of properties, but when later the community adds a new
> crucial property, we could miss it in our logs.
>
> We could log requests at each user interface (thankfully, we don't allow
> shell access for users), but that would mean having copies of the same
> logic in different subsystems, which is error prone, plus those copies
> will definitely diverge with time.
>
> Does anyone have any idea on how to best implement such a requirement?
>
> Alexander Amelkin
> YADRO
Yes.  This topic came up in yesterday's OpenBMC security working group 
meeting.  My impression of the main idea is to enhance OpenBMC with an 
AAA (authentication, authorization, and accountability/auditing) 
management interface.  When enabled, all external security-related 
requests would use the AAA service to authenticate, authorize, and audit 
the function.  That is, they would pass in the user's credentials 
(userid&password, certificate, etc) along with a request to perform an 
operation (example operations: read host server part inventory, reboot 
the host) and get a yes/no answer from the AAA service.  Then either 
deny the request or perform it.

A very basic AAA service would be to use the Linux username/password 
checker (/etc/passwd, PAM, LDAP), allow all operations, and write no 
audit records.  A more advanced AAA service provider might contact a 
separate AAA server to perform this function.  The advantages with the 
remote server approach is that user credentials would not have to be 
stored on the BMC, and audit records would not take up space on the BMC.

To make this work, OpenBMC would have to:
1. Create an AAA interface (from an open source project?) and create a 
very basic AAA service provider.
2. Define the operations the the AAA service recognizes and the external 
interfaces use.
3. Change all external interfaces (REST APIs, IPMI, etc.) to invoke the 
AAA service

I've started to outline some of the security considerations for this 
approach in the security docs, current being reviewed in 
https://gerrit.openbmc-project.xyz/#/c/10443/ in file 
obmc-protection-profile-modules section named "AAA Management service".

- Joseph Reynolds

--------------AAFF0B08B14E0AEAEF872933
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 5/28/2018 7:26 AM,
      <a class="moz-txt-link-abbreviated" href="mailto:openbmc-request@lists.ozlabs.org">openbmc-request@lists.ozlabs.org</a> wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:mailman.121.1527510407.18429.openbmc@lists.ozlabs.org">
      <pre wrap="">Message: 2
Date: Mon, 28 May 2018 15:00:06 +0300
From: Alexander Amelkin <a class="moz-txt-link-rfc2396E" href="mailto:a.amelkin@yadro.com" moz-do-not-send="true">&lt;a.amelkin@yadro.com&gt;</a>
To: <a class="moz-txt-link-rfc2396E" href="mailto:openbmc@lists.ozlabs.org" moz-do-not-send="true">&lt;openbmc@lists.ozlabs.org&gt;</a>
Subject: Logging user actions
Message-ID: <a class="moz-txt-link-rfc2396E" href="mailto:c0569989-b52d-745e-06fb-e92cbb1234c8@yadro.com" moz-do-not-send="true">&lt;c0569989-b52d-745e-06fb-e92cbb1234c8@yadro.com&gt;</a>
Content-Type: text/plain; charset="utf-8"

Hi all!

Customers ask us for extensive user action logging. That is, they want
to log everything that a user may change in the system. They want to
know who, how (via which interface) and when changed what. That includes
but is not limited to network configuration, host power on/off, reboots,
power restoration policy changing, firmware updates, user
addition/deletion and password changing, et al. 

We could listen for dbus signals and log most of that, but that way we
wouldn't know whether a user made a change or that was some internal
work. Additionally, that would yield an enormous amount of data logged
if we just log every property change. We could limit logging to a
predefined subset of properties, but when later the community adds a new
crucial property, we could miss it in our logs.

We could log requests at each user interface (thankfully, we don't allow
shell access for users), but that would mean having copies of the same
logic in different subsystems, which is error prone, plus those copies
will definitely diverge with time.

Does anyone have any idea on how to best implement such a requirement?

Alexander Amelkin
YADRO</pre>
    </blockquote>
    Yes.  This topic came up in yesterday's OpenBMC security working
    group meeting.  My impression of the main idea is to enhance OpenBMC
    with an AAA (authentication, authorization, and
    accountability/auditing) management interface.  When enabled, all
    external security-related requests would use the AAA service to
    authenticate, authorize, and audit the function.  That is, they
    would pass in the user's credentials (userid&amp;password,
    certificate, etc) along with a request to perform an operation
    (example operations: read host server part inventory, reboot the
    host) and get a yes/no answer from the AAA service.  Then either
    deny the request or perform it.<br>
    <br>
    A very basic AAA service would be to use the Linux username/password
    checker (/etc/passwd, PAM, LDAP), allow all operations, and write no
    audit records.  A more advanced AAA service provider might contact a
    separate AAA server to perform this function.  The advantages with
    the remote server approach is that user credentials would not have
    to be stored on the BMC, and audit records would not take up space
    on the BMC.<br>
    <br>
    To make this work, OpenBMC would have to:<br>
    1. Create an AAA interface (from an open source project?) and create
    a very basic AAA service provider.<br>
    2. Define the operations the the AAA service recognizes and the
    external interfaces use.<br>
    3. Change all external interfaces (REST APIs, IPMI, etc.) to invoke
    the AAA service<br>
    <br>
    I've started to outline some of the security considerations for this
    approach in the security docs, current being reviewed in
    <a class="moz-txt-link-freetext" href="https://gerrit.openbmc-project.xyz/#/c/10443/">https://gerrit.openbmc-project.xyz/#/c/10443/</a> in file
    obmc-protection-profile-modules section named "AAA Management
    service".<br>
    <br>
    - Joseph Reynolds<br>
  </body>
</html>

--------------AAFF0B08B14E0AEAEF872933--

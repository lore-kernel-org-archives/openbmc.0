Return-Path: <joseph-reynolds@charter.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=charter.net
 (client-ip=68.114.190.30; helo=mtaout005-public.msg.strl.va.charter.net;
 envelope-from=joseph-reynolds@charter.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=charter.net
Received: from mtaout005-public.msg.strl.va.charter.net
 (mtaout005-public.msg.strl.va.charter.net [68.114.190.30])
 by lists.ozlabs.org (Postfix) with ESMTP id 42kHQ4557szDrRP
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 01:42:51 +1100 (AEDT)
Received: from impout001 ([68.114.189.16]) by mtaout005.msg.strl.va.charter.net
 (InterMail vM.9.00.023.01 201-2473-194) with ESMTP
 id <20181029144249.DSLQ3846.mtaout005.msg.strl.va.charter.net@impout001>
 for <openbmc@lists.ozlabs.org>; Mon, 29 Oct 2018 09:42:49 -0500
Received: from [192.168.2.5] ([97.86.254.207]) by impout001 with charter.net
 id tSio1y0044VFKzV01SioQJ; Mon, 29 Oct 2018 09:42:48 -0500
X-Authority-Analysis: v=2.2 cv=ffHd8wYF c=1 sm=1 tr=0
 a=TxbYGM+zWkYih0pDanbSSw==:117 a=TxbYGM+zWkYih0pDanbSSw==:17 a=e-GSelqVAAAA:8
 a=r77TgQKjGQsHNAKrUKIA:9 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8 a=b1XivoNLAAAA:8
 a=NEAV23lmAAAA:8 a=dpRSjrXKAAAA:8 a=GJDv-54Odbda0nSflJ0A:9 a=QEXdDO2ut3YA:10
 a=Fg1QKBJd6JgA:10 a=-FEs8UIgK8oA:10 a=NWVoK91CQyQA:10
 a=e4y9Wiy5UMcKC8Kw6jAA:9 a=Mk1ZZN00_X6E2PR1:21 a=_W_S_7VecoQA:10
 a=VTQqQez33RekakbJVocy:22 a=IC2XNlieTeVoXbcui8wp:22 a=q_f4f4XeMA-WTv669ftq:22
 a=xkwab4zIHtOjTkBAMNFX:22
X-Auth-id: am9zZXBoLXJleW5vbGRzQGNoYXJ0ZXIubmV0
Subject: Re: jenkins.openbmc.org server infrastructure
To: openbmc@lists.ozlabs.org
References: <mailman.13.1540515603.32722.openbmc@lists.ozlabs.org>
From: Joseph Reynolds <joseph-reynolds@charter.net>
Message-ID: <30bb965b-31a4-b402-cfeb-855b92f6e53c@charter.net>
Date: Mon, 29 Oct 2018 09:42:45 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <mailman.13.1540515603.32722.openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative;
 boundary="------------3A000CFB9869D3179663E214"
Content-Language: en-US
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
X-List-Received-Date: Mon, 29 Oct 2018 14:42:54 -0000

This is a multi-part message in MIME format.
--------------3A000CFB9869D3179663E214
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


> Message: 1
> Date: Thu, 25 Oct 2018 14:49:20 -0500
> From: Andrew Geissler <geissonator@gmail.com>
> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: jenkins.openbmc.org ?
> Message-ID:
> 	<CALLMt=pqTesc1qD3wCsv6GTZVRgh2CM1_zF+PM3VVGiDyKf6Qg@mail.gmail.com>
> Content-Type: text/plain; charset="UTF-8"
>
> I'd had on my list for a while to move us over to a jenkins instance
> running on the same server as our gerrit server. The reasoning was:
>
> 1. OpenBMC has grown to the point where it deserves it's own jenkins
> instance, and tying it to openpower.xyz doesn't really fit anymore.
> 2. The gerrit server (and the new jenkins server) are running within
> Softlayer which has 24x7 support (openpower.xyz is running on donated
> hardware from Rackspace, which is awesome, but support is mainly 2nd
> hand via emails to contacts we have at Rackspace)
> 3. There have been a few instances where the openpower builds have
> affected openbmc (and vice versa).
>
> I went ahead and created a new jenkins instance at the above domain,
> but haven't done anything with it. I've been kind of wishy-washy on
> whether the extra work is really worth it. It's been quite nice having
> Joel maintain our openpower.xyz server with all the security updates
> and such :)
>
> Thoughts from the community?

Andrew, your email reads like a plea for help with OpenBMC project 
infrastructure (systems that host OpenBMC servers for Gerrit, Jenkins, 
and related CI).  If so, it may help to understand the current 
configuration.  Here is my understanding:

- GitHub (source code mirror), hosted by GitHub at 
https://github.com/openbmc (various repos).
  - Gerrit (code review tool), hosted by 
https://gerrit.openbmc-project.xyz (and redirected from gerrit.openbmc.org).
  - Jenkins (CI server), hosted by https://openpower.xyz, proposal to 
move to a new server at https://jenkins.openbmc.org.
  - Various CI build and test servers (run jobs on different hardware 
architectures).
  - See history in 
https://lists.ozlabs.org/pipermail/openbmc/2016-July/004280.html

Then reading questions into the email:

  * Are community members comfortable with these Gerrit and Jenkins
    servers in terms of ownership and administration privileges?
  * Should we have a larger variety of CI servers?
  * Do we need help administering these servers (workload: reboot
    servers, update Jenkins version, restart CI jobs, etc.)?
  * What are the project ideals?


> ps: gerrit.openbmc.org will also redirect to our gerrit in case anyone
> was interested.
>
> Andrew
>


--------------3A000CFB9869D3179663E214
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <blockquote type="cite"
      cite="mid:mailman.13.1540515603.32722.openbmc@lists.ozlabs.org">
      <pre wrap="">Message: 1
Date: Thu, 25 Oct 2018 14:49:20 -0500
From: Andrew Geissler <a class="moz-txt-link-rfc2396E" href="mailto:geissonator@gmail.com">&lt;geissonator@gmail.com&gt;</a>
To: OpenBMC Maillist <a class="moz-txt-link-rfc2396E" href="mailto:openbmc@lists.ozlabs.org">&lt;openbmc@lists.ozlabs.org&gt;</a>
Subject: jenkins.openbmc.org ?
Message-ID:
	<a class="moz-txt-link-rfc2396E" href="mailto:CALLMt=pqTesc1qD3wCsv6GTZVRgh2CM1_zF+PM3VVGiDyKf6Qg@mail.gmail.com">&lt;CALLMt=pqTesc1qD3wCsv6GTZVRgh2CM1_zF+PM3VVGiDyKf6Qg@mail.gmail.com&gt;</a>
Content-Type: text/plain; charset="UTF-8"

I'd had on my list for a while to move us over to a jenkins instance
running on the same server as our gerrit server. The reasoning was:

1. OpenBMC has grown to the point where it deserves it's own jenkins
instance, and tying it to openpower.xyz doesn't really fit anymore.
2. The gerrit server (and the new jenkins server) are running within
Softlayer which has 24x7 support (openpower.xyz is running on donated
hardware from Rackspace, which is awesome, but support is mainly 2nd
hand via emails to contacts we have at Rackspace)
3. There have been a few instances where the openpower builds have
affected openbmc (and vice versa).

I went ahead and created a new jenkins instance at the above domain,
but haven't done anything with it. I've been kind of wishy-washy on
whether the extra work is really worth it. It's been quite nice having
Joel maintain our openpower.xyz server with all the security updates
and such :)

Thoughts from the community?
</pre>
    </blockquote>
    <br>
    <p style="margin: 0px; font-stretch: normal; line-height: normal;"><span
        style="background-color: rgba(255, 255, 255, 0);">Andrew, your
        email reads like a plea for help with OpenBMC project
        infrastructure (systems that host OpenBMC servers for Gerrit,
        Jenkins, and related CI).  If so, it may help to understand the
        current configuration.  Here is my understanding:</span></p>
     <span style="background-color: rgba(255, 255, 255, 0);">- GitHub
      (source code mirror), hosted by GitHub at
      <a class="moz-txt-link-freetext" href="https://github.com/openbmc">https://github.com/openbmc</a> (various repos).</span><br>
    <span style="background-color: rgba(255, 255, 255, 0);"><span
        style="background-color: rgba(255, 255, 255, 0);"> - </span>Gerrit
      (code review tool), hosted by <a class="moz-txt-link-freetext" href="https://gerrit.openbmc-project.xyz">https://gerrit.openbmc-project.xyz</a>
      (and redirected from gerrit.openbmc.org).</span><br>
    <span style="background-color: rgba(255, 255, 255, 0);"><span
        style="background-color: rgba(255, 255, 255, 0);"> - </span>Jenkins
      (CI server), hosted by <a class="moz-txt-link-freetext" href="https://openpower.xyz">https://openpower.xyz</a>, proposal to move to
      a new server at <a class="moz-txt-link-freetext" href="https://jenkins.openbmc.org">https://jenkins.openbmc.org</a>.</span><br>
    <span style="background-color: rgba(255, 255, 255, 0);"><span
        style="background-color: rgba(255, 255, 255, 0);"> - </span>Various
      CI build and test servers (run jobs on different hardware
      architectures).</span><br>
    <span style="background-color: rgba(255, 255, 255, 0);"><span
        style="background-color: rgba(255, 255, 255, 0);"> - </span>See
      history in <a
        href="https://lists.ozlabs.org/pipermail/openbmc/2016-July/004280.html">https://lists.ozlabs.org/pipermail/openbmc/2016-July/004280.html</a></span><br>
    <br>
    Then reading questions into the email:<br>
    <ul>
      <li style="margin: 0px; font-stretch: normal; line-height:
        normal;"><span style="background-color: rgba(255, 255, 255, 0);">Are
          community members comfortable with these Gerrit and Jenkins
          servers in terms of ownership and administration privileges?</span></li>
      <li style="margin: 0px; font-stretch: normal; line-height:
        normal;"><span style="background-color: rgba(255, 255, 255, 0);">Should
          we have a larger variety of CI servers?<br>
        </span></li>
      <li style="margin: 0px; font-stretch: normal; line-height:
        normal;"><span style="background-color: rgba(255, 255, 255, 0);">Do
          we need help administering these servers (workload: reboot
          servers, update Jenkins version, restart CI jobs, etc.)?</span></li>
      <li style="margin: 0px; font-stretch: normal; line-height:
        normal;"><span style="background-color: rgba(255, 255, 255, 0);">What
          are the project ideals?</span></li>
    </ul>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:mailman.13.1540515603.32722.openbmc@lists.ozlabs.org">
      <pre wrap="">
ps: gerrit.openbmc.org will also redirect to our gerrit in case anyone
was interested.

Andrew

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------3A000CFB9869D3179663E214--

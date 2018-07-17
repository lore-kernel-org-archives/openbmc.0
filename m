Return-Path: <joseph-reynolds@charter.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=charter.net
 (client-ip=68.114.190.28; helo=mtaout003-public.msg.strl.va.charter.net;
 envelope-from=joseph-reynolds@charter.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=charter.net
Received: from mtaout003-public.msg.strl.va.charter.net
 (mtaout003-public.msg.strl.va.charter.net [68.114.190.28])
 by lists.ozlabs.org (Postfix) with ESMTP id 41V4Cr2bjCzF35g
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 12:36:22 +1000 (AEST)
Received: from impout002 ([68.114.189.17]) by mtaout003.msg.strl.va.charter.net
 (InterMail vM.9.00.023.01 201-2473-194) with ESMTP
 id <20180717023620.DTQN7355.mtaout003.msg.strl.va.charter.net@impout002>
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jul 2018 21:36:20 -0500
Received: from [192.168.2.8] ([97.86.254.207]) by impout002 with charter.net
 id BecK1y00P4VFKzV01ecLr7; Mon, 16 Jul 2018 21:36:20 -0500
X-Authority-Analysis: v=2.2 cv=C6eZ8UH+ c=1 sm=1 tr=0
 a=TxbYGM+zWkYih0pDanbSSw==:117 a=TxbYGM+zWkYih0pDanbSSw==:17
 a=x7bEGLp0ZPQA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=voM4FWlXAAAA:8 a=tcme9c7lAAAA:8
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=yyJhbDGUAAAA:8 a=e-GSelqVAAAA:8
 a=dpRSjrXKAAAA:8 a=RmK5OVKQQaUxjxo7yGIA:9 a=A_AnVfsupRrzAZWs:21
 a=n1741RazztEWj3N6:21 a=QEXdDO2ut3YA:10 a=KkmPwhAMVVwA:10 a=ESXXJOcZ9k8A:10
 a=U3n7YvTwqyMA:10 a=-FEs8UIgK8oA:10 a=NWVoK91CQyQA:10
 a=_At2OnMFCR_fn8a4XFEA:9 a=bYALXymi7-CtfB0T:21 a=gTUmpoAx1vmtLFVY:21
 a=LMvmRNkLxRYvlcLW:21 a=_W_S_7VecoQA:10 a=IC2XNlieTeVoXbcui8wp:22
 a=cJsI3S3cdgERF2JXxJch:22 a=AjGcO6oz07-iQ99wixmX:22 a=N1KAkYT4l1eb6tGI3RYA:22
 a=VTQqQez33RekakbJVocy:22 a=xkwab4zIHtOjTkBAMNFX:22
X-Auth-id: am9zZXBoLXJleW5vbGRzQGNoYXJ0ZXIubmV0
Subject: Re: How to handle security vulnerabilities
To: openbmc@lists.ozlabs.org
References: <mailman.985.1531736364.32318.openbmc@lists.ozlabs.org>
From: Joseph Reynolds <joseph-reynolds@charter.net>
Message-ID: <a6b0fe6f-52d3-d0a0-a6db-24e223af6c99@charter.net>
Date: Mon, 16 Jul 2018 21:36:15 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <mailman.985.1531736364.32318.openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative;
 boundary="------------A544C6E3EF3D4F5B496173B4"
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2018 02:36:25 -0000

This is a multi-part message in MIME format.
--------------A544C6E3EF3D4F5B496173B4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/16/2018 5:19 AM, openbmc-request@lists.ozlabs.org wrote:
> Message: 1
> Date: Sun, 15 Jul 2018 22:11:18 -0400
> From: Brad Bishop<bradleyb@fuzziesquirrel.com>
> To: Andrew Jeffery<andrew@aj.id.au>
> Cc:openbmc@lists.ozlabs.org
> Subject: Re: How to handle security vulnerabilities (was: OpenBMC
> 	security workgroup status)
> Message-ID:<AC6EEF0D-8D17-4936-A6DD-4059CB459EBC@fuzziesquirrel.com>
> Content-Type: text/plain; charset=us-ascii
>
>
>> On Jul 13, 2018, at 2:56 AM, Andrew Jeffery<andrew@aj.id.au>  wrote:
>>
>> On Fri, 13 Jul 2018, at 07:49, Joseph Reynolds wrote:
>>>> What's the short-term strategy for handling [security] vulnerability
>>>> reports received in the gap between now and getting some formal
>>>> process in place?
>>> We don't have a strategy.  Let's discuss it here.
>>>
>>> Officially (https://github.com/openbmc/openbmc/  section "Bug Reporting")
>>> issues are managed on GitHub.
>>>
>>> Unofficially, Brad volunteered to accept one batch of security
>>> vulnerability reports and distribute them, presumably to the OpenBMC TSC
>>> members (https://github.com/openbmc/docs  section "Technical Steering
>>> Committee ") or their delegates.  I assume they would privately contact
>>> a trusted OpenBMC contributor who could address the problem.
>>>
>>> We could adapt the Linux model
>>> (https://www.kernel.org/doc/html/v4.16/admin-guide/security-bugs.html),
>>> although I am still looking for information on what the Linux security
>>> team does with the bug report.  For example, how security group members
>>> track and discuss problems among themselves, how they pull in additional
>>> resources to fix or mitigate the problem, and how they inform downstream
>>> distros before announcing the problem, etc.
>> I thought the documention described most of this?security@kernel.org  is a private list, so discussions can happen there freely. With respect to informing downstream distros, as mentioned that's done via thelinux-distros@vs.openwall.org  list. As for how they pull in additional resources to fix or mitigate the problem, that's going to depend on the affected parties. No-one can order anyone to fix a particular problem, but the developers/maintainers/vendors involved have skin in the game so should be motivated to fix the issue.
>>
>>> I think the first step for the OpenBMC team is to establish an email
>>> address (likesecurity@openbmc.org), subscribe only trusted people to
>>> that email list, and update the docs to explain that you should email
>>> the security team for security questions, and use issues for everything
>>> else.
>> Sounds good to me. Who can sort out security@? Brad? I'm sure we could sort out list hosting on ozlabs.org if necessary (like we use for this list).
> Unless someone replies in the negative in the next couple days, lets just
> do another list on ozlabs.org, if ozlabs.org is ok with that:-)
>
>>> Presumably, the security team would communicate privately among
>>> themselves and the submitter to assess the situation, and contact
>>> OpenBMC community members privately to address the problem.
>>> This would be an easy step to take, and would move the team in the right
>>> direction.  What do you think?
>> Sounds good enough for the moment!
>>
>> Andrew
The description of the OpenBMC security vulnerability reporting program 
we agreed to during the community call is now in review: 
https://gerrit.openbmc-project.xyz/#/c/11511, so please review it.


--------------A544C6E3EF3D4F5B496173B4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 7/16/2018 5:19 AM, <a class="moz-txt-link-abbreviated" href="mailto:openbmc-request@lists.ozlabs.org">openbmc-request@lists.ozlabs.org</a> wrote:<br>
    <blockquote type="cite"
      cite="mid:mailman.985.1531736364.32318.openbmc@lists.ozlabs.org">
      <pre wrap="">Message: 1
Date: Sun, 15 Jul 2018 22:11:18 -0400
From: Brad Bishop <a class="moz-txt-link-rfc2396E" href="mailto:bradleyb@fuzziesquirrel.com" moz-do-not-send="true">&lt;bradleyb@fuzziesquirrel.com&gt;</a>
To: Andrew Jeffery <a class="moz-txt-link-rfc2396E" href="mailto:andrew@aj.id.au" moz-do-not-send="true">&lt;andrew@aj.id.au&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:openbmc@lists.ozlabs.org" moz-do-not-send="true">openbmc@lists.ozlabs.org</a>
Subject: Re: How to handle security vulnerabilities (was: OpenBMC
	security workgroup status)
Message-ID: <a class="moz-txt-link-rfc2396E" href="mailto:AC6EEF0D-8D17-4936-A6DD-4059CB459EBC@fuzziesquirrel.com" moz-do-not-send="true">&lt;AC6EEF0D-8D17-4936-A6DD-4059CB459EBC@fuzziesquirrel.com&gt;</a>
Content-Type: text/plain; charset=us-ascii


</pre>
      <blockquote type="cite" style="color: #000000;">
        <pre wrap="">On Jul 13, 2018, at 2:56 AM, Andrew Jeffery <a class="moz-txt-link-rfc2396E" href="mailto:andrew@aj.id.au" moz-do-not-send="true">&lt;andrew@aj.id.au&gt;</a> wrote:

On Fri, 13 Jul 2018, at 07:49, Joseph Reynolds wrote:
</pre>
        <blockquote type="cite" style="color: #000000;">
          <blockquote type="cite" style="color: #000000;">
            <pre wrap="">What's the short-term strategy for handling [security] vulnerability
reports received in the gap between now and getting some formal
process in place? 
</pre>
          </blockquote>
          <pre wrap="">We don't have a strategy.  Let's discuss it here.

Officially (<a class="moz-txt-link-freetext" href="https://github.com/openbmc/openbmc/" moz-do-not-send="true">https://github.com/openbmc/openbmc/</a> section "Bug Reporting")
issues are managed on GitHub. 

Unofficially, Brad volunteered to accept one batch of security
vulnerability reports and distribute them, presumably to the OpenBMC TSC
members (<a class="moz-txt-link-freetext" href="https://github.com/openbmc/docs" moz-do-not-send="true">https://github.com/openbmc/docs</a> section "Technical Steering
Committee ") or their delegates.  I assume they would privately contact
a trusted OpenBMC contributor who could address the problem. 

We could adapt the Linux model
(<a class="moz-txt-link-freetext" href="https://www.kernel.org/doc/html/v4.16/admin-guide/security-bugs.html" moz-do-not-send="true">https://www.kernel.org/doc/html/v4.16/admin-guide/security-bugs.html</a>),
although I am still looking for information on what the Linux security
team does with the bug report.  For example, how security group members
track and discuss problems among themselves, how they pull in additional
resources to fix or mitigate the problem, and how they inform downstream
distros before announcing the problem, etc. 
</pre>
        </blockquote>
        <pre wrap="">I thought the documention described most of this? <a class="moz-txt-link-abbreviated" href="mailto:security@kernel.org" moz-do-not-send="true">security@kernel.org</a> is a private list, so discussions can happen there freely. With respect to informing downstream distros, as mentioned that's done via the <a class="moz-txt-link-abbreviated" href="mailto:linux-distros@vs.openwall.org" moz-do-not-send="true">linux-distros@vs.openwall.org</a> list. As for how they pull in additional resources to fix or mitigate the problem, that's going to depend on the affected parties. No-one can order anyone to fix a particular problem, but the developers/maintainers/vendors involved have skin in the game so should be motivated to fix the issue.

</pre>
        <blockquote type="cite" style="color: #000000;">
          <pre wrap="">I think the first step for the OpenBMC team is to establish an email
address (like <a class="moz-txt-link-abbreviated" href="mailto:security@openbmc.org" moz-do-not-send="true">security@openbmc.org</a>), subscribe only trusted people to
that email list, and update the docs to explain that you should email
the security team for security questions, and use issues for everything
else. 
</pre>
        </blockquote>
        <pre wrap="">Sounds good to me. Who can sort out security@? Brad? I'm sure we could sort out list hosting on ozlabs.org if necessary (like we use for this list).
</pre>
      </blockquote>
      <pre wrap="">Unless someone replies in the negative in the next couple days, lets just
do another list on ozlabs.org, if ozlabs.org is ok with that <span class="moz-smiley-s1" title=":-)"><span>:-)</span></span>

</pre>
      <blockquote type="cite" style="color: #000000;">
        <blockquote type="cite" style="color: #000000;">
          <pre wrap="">Presumably, the security team would communicate privately among
themselves and the submitter to assess the situation, and contact
OpenBMC community members privately to address the problem. 
This would be an easy step to take, and would move the team in the right
direction.  What do you think?
</pre>
        </blockquote>
        <pre wrap="">Sounds good enough for the moment!

Andrew
</pre>
      </blockquote>
    </blockquote>
    The description of the OpenBMC security vulnerability reporting
    program we agreed to during the community call is now in review:
    <a class="moz-txt-link-freetext" href="https://gerrit.openbmc-project.xyz/#/c/11511">https://gerrit.openbmc-project.xyz/#/c/11511</a>, so please review it.<br>
    <br>
  </body>
</html>

--------------A544C6E3EF3D4F5B496173B4--

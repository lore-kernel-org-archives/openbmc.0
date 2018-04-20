Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::236; helo=mail-ot0-x236.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fBYOg7dd"; 
 dkim-atps=neutral
Received: from mail-ot0-x236.google.com (mail-ot0-x236.google.com
 [IPv6:2607:f8b0:4003:c0f::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40SG0c2ZzyzF22j
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 22:50:08 +1000 (AEST)
Received: by mail-ot0-x236.google.com with SMTP id m22-v6so9451117otf.8
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 05:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=vZYyTRinPp0Lf6OwrDO6b8Z6Ts9A3kUOkxwagRIpVDQ=;
 b=fBYOg7ddr/mlXFbZjV+0hhF+7uKBTCknQzpipOURnrkmZHnGhmTSeYW3itkN0WIU0J
 G8g9YDmDy8mGZsa6+Y++hQnJcnz6FdgkyG2OTFduwP304E+rWB4cHU4lVP0ViU2T2JiU
 wUUOBbwJGW2nNRPLjRVgjiaM7IUK5Dazx4QjXu7omA4n+SOzcvUBx823sLjhI3fABO3Z
 69V+t2Jvugdpt/dyhuPY1sQjxWi36FiQbTMQdaqMVr1i/WfQOXZONSFQd/LXQAZHpCsj
 axUxmz0EvSCXsFl8sYx731C/eELqdJyZUjhPqK/oR7/++Zcmzi3nGnXvU/oXb0oJuori
 mk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=vZYyTRinPp0Lf6OwrDO6b8Z6Ts9A3kUOkxwagRIpVDQ=;
 b=o0O/7lt3EZqjy8qI6u055IzkjV+VhaLEqYBavGzzVjkUNk7OlVUlBxoBO+z3mI8Ada
 0qXYrfcp4sj54TRbAy00y6BmA9Eq/vsL2VNFxhlu0MEx0tsthq/nDUP2wKW0azJ6C4xY
 fCYZpsz7a+H/XLmalj+8uvP6SKcBraO+a4CgVX87KF1ufilu3qfaomEg0zKdjum45Ffx
 fULF+SnP4o9VNeJQVZR/Esa0cCViRJcffA9A1oY9Yan08CLLCGSOs3/6ummCQu2CcBHz
 zecoC2x7Fq9A/HgE0gEORezA/B/svI1fGJZvmndQ3ixa0ph27MiPhXbmGAnJT8f1LGIC
 whNw==
X-Gm-Message-State: ALQs6tCR/onihFP3rqqCwhjEJEixm4HTCy9qu7iSGsstiC64Qmkk84ny
 E9TGjPlH1xNGoL0vfkbKPjNaGZNIcLZPing/IFQ=
X-Google-Smtp-Source: AB8JxZqi40c2O7eyMDaSnxZxD+nYR1ptmbhsKzt02PERaAVYUWygUfwQaJndR3swBFJZ5bKzWoFmPNRN4S8Ff4enCs0=
X-Received: by 2002:a9d:1556:: with SMTP id
 z22-v6mr2752255otz.349.1524228605299; 
 Fri, 20 Apr 2018 05:50:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.50.79 with HTTP; Fri, 20 Apr 2018 05:50:04 -0700 (PDT)
In-Reply-To: <CAARXrtncu8O6sH3R33S=X68gmXAPO16_fkF0d1EOeaDhHPqiLw@mail.gmail.com>
References: <CALLMt=rhu44zQUK3rv4vzCCzLJ7ehevQ-UQB8ydzdG0AHCvQSw@mail.gmail.com>
 <CALLMt=omgN_yj6GjEaKRwWaKp4wKR++6cx3+NHixNi7YMHBm6g@mail.gmail.com>
 <CALLMt=qZkG1e2dnJm9EfVpjotq-myc5RAY2OHVxoxLNdHiYoCQ@mail.gmail.com>
 <87in8mfib1.fsf@linux.vnet.ibm.com>
 <cf4ed490-47a2-d644-f929-1fbcddf27c2d@ozlabs.org>
 <CAARXrtncu8O6sH3R33S=X68gmXAPO16_fkF0d1EOeaDhHPqiLw@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 20 Apr 2018 07:50:04 -0500
Message-ID: <CALLMt=r6b2Vb=bPcTndHecmp8pHAoOw7pwYUAyk0RCxoN9zNUA@mail.gmail.com>
Subject: Re: Fwd: Migration to new gerrit server is coming
To: Lei YU <mine260309@gmail.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, Stewart Smith <stewart@linux.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 20 Apr 2018 12:50:09 -0000

On Fri, Apr 20, 2018 at 2:54 AM, Lei YU <mine260309@gmail.com> wrote:
> On Fri, Apr 20, 2018 at 3:31 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
>> Hi Stewart,
>>
>>> It could quite legitimately be IBM being stupid with email (again), but
>>> could this be because of the migration?
>>
>> I'm getting these to my non-IBM email account, with the sendgrid link
>> rewrite. So it's not just IBM SMTP here.
>
> Me too, the gerrit's mail contains a lot of links staring with
> u7284519.ct.sendgrid.net, probably gerrit is configured to use SendGrid[1]'s
> service?
>
> [1]: https://en.wikipedia.org/wiki/SendGrid

Yeah, our new VM is on a Softlayer system and they partner with
SendGrid for email services (we were using Patrick's private email
server before for sending emails).  I found some options in the
SendGrid UI to disable all tracking.  I'm hoping that helps.

Andrew

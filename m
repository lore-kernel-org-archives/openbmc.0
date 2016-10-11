Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x22f.google.com (mail-vk0-x22f.google.com
 [IPv6:2607:f8b0:400c:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3stRm3162lzDrSF
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 17:24:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=sI3k+YtU; 
 dkim-atps=neutral
Received: by mail-vk0-x22f.google.com with SMTP id 2so9942562vkb.3
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 23:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=lGdJ2IFQrKB8q/rtGxNQldjx+iook9KVtbWqgRaNZUw=;
 b=sI3k+YtUYu/4lTO6/yFLvvOOerOrYgDbj3Iim43e7m57VYGdMzfl/Klnv4YaxOo9bo
 jvH5T4yJIn0rfcyGX0jf0cWUhYj81ej11Lxv98NbzAH/khkAGqbAyYuu/8E7iAu2+EFC
 MCuUrOD7Q5B4SdTE3CIApEccyd9TtO6w3Tg7KzVrEKZPJHvEIcC+sXOcZOs3hCWWetux
 zWdFHcNQ0BxsrkIqKOyl3Ak6MXl+gNYGixZdo7gUDmozz9fex6xQQdNx6/DxWUyI5zPb
 CB5BOTJtl0Tiw6ors/vU+P7ehIdHIL2MZ2/ks7QjeroYkDaC5VtD0uIQioUU4xJxP8Bn
 j51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=lGdJ2IFQrKB8q/rtGxNQldjx+iook9KVtbWqgRaNZUw=;
 b=bHt+8eUkLcivLMYft5NFZOxq1p2wRgvwjX35z6/OkOOHjEICu3OrGF1Q3azVrG0dCZ
 pKxN/CIFqQg0/Gjffx8KnyT9g9jt+lPUmaLoBfGmog7xht/Z84SIrWF+nKx3HtPfDunC
 yf3CfPvw3V3PXxQp0FZ2YyY9KHYMuGpZXsgDsT6uo5577H26WwbjjGVXorceXq3AsMY7
 099noh/FyLtEJn9OI/D8SN2pC70VqJzpka0xYCvdkIcJMaPTIafZSKTq7rGngqBiBIai
 T7lWC3vJqc08xBo4qHl21UGwlYhbHFfJ2lRDnZtuo/ZkDJmkmIL3muo+vr/nwlNZK22v
 y1OA==
X-Gm-Message-State: AA6/9Rm7rYIo/srwZ7a2sBCdR/2qbHvr+3qS+lLYjLLnaWjTCauXj6DfENYFqPNY/cvlV+0nkssh+YSiABX/tg==
X-Received: by 10.31.129.194 with SMTP id c185mr260336vkd.67.1476167056044;
 Mon, 10 Oct 2016 23:24:16 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Mon, 10 Oct 2016 23:23:55 -0700 (PDT)
In-Reply-To: <CACPK8XcFhtDn121B2r6Wv_E8FHWSTw9JFXvpVAt4fkdq3p8+aA@mail.gmail.com>
References: <CACPK8XfQPDg0H_aNKmZOje7pPDRE9sJsD-epqAB8uW2X6SrrDg@mail.gmail.com>
 <CALLMt=rbR1usfKPt9G8kdUa2RaqRaaVEG3rV62wSBjaM59qi6Q@mail.gmail.com>
 <CACPK8Xcn=s3NAnVNOYBXwHrnfYPT7xicH-TTXTb50TJU6OHHrA@mail.gmail.com>
 <20160930013816.GC7390@heinlein.lan>
 <CACPK8Xd3vP0E14-QSnpKxcLYdnaf=eqZb3hvfm26QCEZCA3aiA@mail.gmail.com>
 <20160930131252.GD7390@heinlein.lan>
 <CALLMt=o-pdSefwGK9rSyoW1+6UzMspzkvQmSnZJrz9h3G89W5w@mail.gmail.com>
 <1476143058.16733.10.camel@aj.id.au> <20161011013601.GA19444@distroguy.com>
 <CALLMt=rTC2rgPc-_rkdVwN=o688AsKg7WvefEBrSZE48GMzRqA@mail.gmail.com>
 <20161011020029.GB19444@distroguy.com>
 <CALLMt=r6FqtAfbGwPH=9TeCq4tsJ9FKFr1g9xA8mP7KKRh36ew@mail.gmail.com>
 <CACPK8XcFhtDn121B2r6Wv_E8FHWSTw9JFXvpVAt4fkdq3p8+aA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 11 Oct 2016 17:23:55 +1100
X-Google-Sender-Auth: 4uDyWebEZoxZII3ETIoYcIr1apk
Message-ID: <CACPK8XeB1cFLJQesU2ELhX=F7Nuqx8vxXsVuL+jxvOLJdvridg@mail.gmail.com>
Subject: Re: openpower.xyz updates
To: Andrew Geissler <geissonator@gmail.com>
Cc: Chris Smart <chris@distroguy.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 11 Oct 2016 06:24:19 -0000

On Tue, Oct 11, 2016 at 1:12 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Tue, Oct 11, 2016 at 1:06 PM, Andrew Geissler <geissonator@gmail.com> wrote:
>>> The log snippet you provided suggests to me that the gerrit trigger
>>> plugin needs to be updated, you can see it's trying to call that
>>> release() here:
>>>
>>> 07:05:18 FATAL: org.eclipse.jgit.revwalk.RevWalk.release()V
>>> 07:05:18 java.lang.NoSuchMethodError:
>>> org.eclipse.jgit.revwalk.RevWalk.release()V
>>> 07:05:18 at
>>> com.sonyericsson.hudson.plugins.gerrit.trigger.hudsontrigger.GerritTriggerBuildChooser$1.invoke(GerritTriggerBuildChooser.java:185)
>>>
>>
>> Yeah, sigh... for some reason, when we had the latest gerrit plugin, I
>> couldn't trigger off of "Comment Added" anymore which is what we use
>> for the CI build trigger.  I didn't find any obvious bug reports for
>> it when I looked.
>
> Do you have the backtrace and log for that failure?

Patrick, can you look at the logs from the gerrit side? Is the
connection succeeding?

Andrew G, I took a look at the Gerrit plugin between 2.21.1 and 2.22.

https://github.com/jenkinsci/gerrit-trigger-plugin/compare/gerrit-trigger-2.21.1...gerrit-trigger-2.22.0

https://issues.jenkins-ci.org/browse/JENKINS-35379

Perhaps we could try bisecting the changes made to the plugin to work
out what went wrong?

Cheers,

Joel

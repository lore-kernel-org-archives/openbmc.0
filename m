Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x229.google.com (mail-vk0-x229.google.com
 [IPv6:2607:f8b0:400c:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3stLBC4g2qzDrSF
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 13:13:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=wGirSEkk; 
 dkim-atps=neutral
Received: by mail-vk0-x229.google.com with SMTP id 2so6607640vkb.3
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 19:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=IlODa9lz2S+i6GugPZ1nipHh363+atZBXZRs7NaDqfA=;
 b=wGirSEkkLK1JNj4zxjCMVuhULzWN/BickBczo/CQxj+oR65zhwiVtDp7n3TPD3/n7x
 c5MXocHQ+upMqyw9qvQnGb/fDkrD2Z5FwiOu9mNzrizJaMo5tT9P4SkrGi484kLjf2Je
 z24fzjqbiD2nwRx4iF46ZTNmu+pYNyJeR//3uEB5v9aTojKkga34hhvf9xOx6LMuSAlo
 hcXi/rI5QgpTmPoHCwiEjbHM8Ll1TIrBiV86ROTMsHmv61NwgMbBhESABWLpNlsTslOC
 OFQLSikONaoSEHuSe+C0NIeWFr9LKDlxr1eD7XroXuMVzyp1bft23p3NALjzCGlygb9y
 Ix4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=IlODa9lz2S+i6GugPZ1nipHh363+atZBXZRs7NaDqfA=;
 b=epovchadJo/d+e3aMVJHzqf0ec6mQuur7+RVdv6MKoPA3nwxKlB9GIE1tYOnl4etGa
 omNGOmOE2986I5143rK3wtPny7Z9jX3d52vyTlV9Vt1NxBN8qR+xZB+K6Zb6kqXM1J69
 fkb2k2OtQ2wxqVpda9kCS5W0jLt1L7suBtnBPmtmZKTPT7V7olZmk4EXf/fTr1zKEGrL
 v6bLEXpBMh0/RCjshGKnS/uKEUBVC1u6kJ90n1egM3VZB0uSGDGmqZvZbQ2eGi6bGf+z
 1q49DnEIDkj/2jeMk52nRXoib6fFkLNfalcEuKJkmY/yd9PVZbj2IntQ2TcRBKSLEAFJ
 Wypg==
X-Gm-Message-State: AA6/9Rk/NC6YQWbMnULXlQLS5i4ceTAyyBNVe57d+5jDlbGuA/MsERyBnD/MeHR75wb5dI57ePq7DDES+5M+zA==
X-Received: by 10.31.4.195 with SMTP id 186mr1294230vke.82.1476151985110; Mon,
 10 Oct 2016 19:13:05 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Mon, 10 Oct 2016 19:12:44 -0700 (PDT)
In-Reply-To: <CALLMt=r6FqtAfbGwPH=9TeCq4tsJ9FKFr1g9xA8mP7KKRh36ew@mail.gmail.com>
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
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 11 Oct 2016 13:12:44 +1100
X-Google-Sender-Auth: X31p4JSqL6pM9nxf5PEufKIipWg
Message-ID: <CACPK8XcFhtDn121B2r6Wv_E8FHWSTw9JFXvpVAt4fkdq3p8+aA@mail.gmail.com>
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
X-List-Received-Date: Tue, 11 Oct 2016 02:13:08 -0000

On Tue, Oct 11, 2016 at 1:06 PM, Andrew Geissler <geissonator@gmail.com> wrote:
>> The log snippet you provided suggests to me that the gerrit trigger
>> plugin needs to be updated, you can see it's trying to call that
>> release() here:
>>
>> 07:05:18 FATAL: org.eclipse.jgit.revwalk.RevWalk.release()V
>> 07:05:18 java.lang.NoSuchMethodError:
>> org.eclipse.jgit.revwalk.RevWalk.release()V
>> 07:05:18 at
>> com.sonyericsson.hudson.plugins.gerrit.trigger.hudsontrigger.GerritTriggerBuildChooser$1.invoke(GerritTriggerBuildChooser.java:185)
>>
>
> Yeah, sigh... for some reason, when we had the latest gerrit plugin, I
> couldn't trigger off of "Comment Added" anymore which is what we use
> for the CI build trigger.  I didn't find any obvious bug reports for
> it when I looked.

Do you have the backtrace and log for that failure?

Cheers,

Joel

Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PCumlTPH"; 
 dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 447zyx09XwzDqLj
 for <openbmc@lists.ozlabs.org>; Wed, 27 Feb 2019 00:23:20 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id j135so10273224oib.13
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 05:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R0bE50VEf+cv3i0d0o0l49Sf7OplBtTzy/GVNYE0V8E=;
 b=PCumlTPHXHswUjJfbFV+95VyT24cQx764k4l9F9/3MmCkgkKT9lGGJ7eXUdmeCPwJZ
 UEqcVdCp5E4oSfWHze45WXXJWuSlNLKbHdlujtgDHSpGDyQcXhF/3A2xDdvV6JMr7Ksz
 GDrMshgJcTk9fQtdxfFbaGmyRQA+QOI18H2XDb1WhM3DIvktuO0xvGHhXjcMtti4Ib2J
 kgpAHuPWLbw8WfTNqkqgkLdaFPgHOUh55Noy5vom7D3NfC6L+ckKUpYLz9wwsNB7bkJv
 6t5scjOB7ZyygmvU68wPCs2JfZexwxV4qnt4aY7SPn7FdnIH4mE0p/UumNZ6+OzF86ik
 o5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R0bE50VEf+cv3i0d0o0l49Sf7OplBtTzy/GVNYE0V8E=;
 b=ierV7h8cDbbQN2vhLbcDSq0ulma0dgSLtUOw7hx8EWaBWh8O/fduLGKMas3gatCooW
 fXEXjvbpPTiA7pGyGWTD6rQOk62OkM3iNO7pd37ipvwln1MHsBa/+y5Op79ofaPlPEG6
 4v0mWZwy9H4WvcnEQ2Ye97t6YowCaYQqZRXpkH2sgxde6DfnMRQz5bdOVok1xpKG6ba2
 LagLJNTeP/ssTSQzMVPqFgzZnSiwW89LNUwUXiulwA68AtO/8GOQDRnVZhqtA85ui/2m
 xue3wxCPLm0gepMzkDdE7+gZHB4tF5JXPEW30bu81sLODBVAXa7ZDRMbMYgfmpcch5kF
 pmKA==
X-Gm-Message-State: AHQUAuYj4YmDDlH1CP01vyFitTf8yBJBrAiZ8GRZGg6EtAiRxKD9+N+f
 lYXi0/2VEJlCMjxRlm48YAN+FU6e0kjCXx177Sx07w==
X-Google-Smtp-Source: AHgI3IYyWL5OI6+7Puy75XKPKuYYAE3MxSmoRIoUt9cchO6aleieofm/Bt/N1s6WONLGV7FKrpUVa4fi3WdOr1OALKQ=
X-Received: by 2002:aca:51cb:: with SMTP id f194mr2326537oib.6.1551187397549; 
 Tue, 26 Feb 2019 05:23:17 -0800 (PST)
MIME-Version: 1.0
References: <c0185b95-00a9-325c-90ec-172751ee6e98@linux.intel.com>
 <2dbf6734-cf35-41aa-b1bc-e1159564c41b@www.fastmail.com>
In-Reply-To: <2dbf6734-cf35-41aa-b1bc-e1159564c41b@www.fastmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 26 Feb 2019 07:23:01 -0600
Message-ID: <CALLMt=oVjPOQJ-+=8CwS2p=7ujLxNChQm4UQtnfSHrj3uikMig@mail.gmail.com>
Subject: Re: gerrit down?
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 26 Feb 2019 13:23:22 -0000

On Tue, Feb 26, 2019 at 2:28 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Tue, 26 Feb 2019, at 17:38, Jia, Chunhui wrote:
> > Brad,
> >
> > Is gerrit server down?
> >
> > I tried to access https://gerrit.openbmc-project.xyz/ and got "502 Bad
> > Gateway".
> >
> >
>
> Yeah, seems to be dead

Back up. Nothing in the logs to indicate why the gerrit process died on us.
We've seen this before, I'll schedule an upgrade to the latest 2.5.XX release
soon and find a backup to restart gerrit outside of my timezone.

Andrew

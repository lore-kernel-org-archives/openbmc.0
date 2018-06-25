Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::230; helo=mail-oi0-x230.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BnBT3TtU"; 
 dkim-atps=neutral
Received: from mail-oi0-x230.google.com (mail-oi0-x230.google.com
 [IPv6:2607:f8b0:4003:c06::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41DtGh4bcTzF132
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jun 2018 01:23:07 +1000 (AEST)
Received: by mail-oi0-x230.google.com with SMTP id h79-v6so12833318oig.13
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 08:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0bbfPfn9j93JLiM9ejm/Q7ZvEi+Y3tooZNAW7amAFLQ=;
 b=BnBT3TtUVMXkUA10LtCqYhwKhU5f/4Sdig2r5AB4JI7WDYdbig/X/TFu1gRd2hyN2k
 MJxtFdPyg3tsGoW53v/ETYrkwB1SBFSGEkjOrPAxs4Q79JfTs0KKYj9yMqNIjPPMRrlW
 YgwWlgNMXBMzQFoLM9xny+ZeFt3CL74WT4CA+/51J2tXaGsguJ55t2+SjbRu9BUfsO9v
 +ERuQsw+EaexdlSRsYWngICwCt+fnpfDVXtNMkpXC7JabxYOMl3CC3V4PXSM0xjhzGjH
 kEuIWBtncICgRE99b9SEJJ0sfmh5IP6XBX1xapdYWbU2nBRqe8tQVgh2f+5S9CJzq8Sv
 nLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0bbfPfn9j93JLiM9ejm/Q7ZvEi+Y3tooZNAW7amAFLQ=;
 b=bz63/9cKQ6hsdbaZJ/Tr6V+5KCYLsurUcnx2DjFFmXNO9A+543vcHOxDwdW0GgWXJQ
 DsYI+GkSxLFln+TOo9KZejoQ2f4LvPvFPI0rbpYpNplQ83bP59ELKuMxm/JVV7eXPBND
 CDCM2JAl5fAG71Aa54pOFpf8ntD97wWLnW7UtGUT7lsEGx2GqExm7i6Xl7k9IVA8mEoW
 CYB3dhAsxA0vAZlMvLV8rF8DLO8965dbAn3WdW9lGcbVhH1Fy+96vWnNnZwBQfEsDnHP
 zcnT/vKobHPsxSOs5cbEmRbCM/16e1vXiBLREn/bprSAabAFhfBnBgWPq0td7btRk3EE
 IkEQ==
X-Gm-Message-State: APt69E2Hn6wXw4W9JGzcfCVLcoOekPZI+y1nVX2d+GfVjU10qK7j+lvv
 BwbCjw37LeEHXiBz+yNVGgXrlWjUBgQDKmA+Bks=
X-Google-Smtp-Source: ADUXVKLVirmWGO1vKvnI4bN0HYeQZ0TwKJpPgJmGVH6PJ6QIsWBFu+9zAg10akzVZAW+JGfEy2bO37V/woOInipsugs=
X-Received: by 2002:aca:e4c8:: with SMTP id
 b191-v6mr6630850oih.106.1529940185418; 
 Mon, 25 Jun 2018 08:23:05 -0700 (PDT)
MIME-Version: 1.0
References: <f86c688b-b237-bdd5-12a0-385f96902581@gmail.com>
In-Reply-To: <f86c688b-b237-bdd5-12a0-385f96902581@gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 25 Jun 2018 10:22:54 -0500
Message-ID: <CALLMt=oAKb+3ggBnFc3XiM6NaB50GsucdSJ0P9k5HVCo7xF9CA@mail.gmail.com>
Subject: Re: OpenBMC Release Planning Working Group
To: Kurt Taylor <kurt.r.taylor@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, alirhas@microsoft.com, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>, james.mihm@intel.com
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
X-List-Received-Date: Mon, 25 Jun 2018 15:23:09 -0000

On Thu, Jun 21, 2018 at 2:08 PM krtaylor <kurt.r.taylor@gmail.com> wrote:
>
> Hi all,
>
> The long anticipated OpenBMC Release Planning working group is now
> forming and will have its first meeting next week. I would like to keep
> the meeting small at first so that we can move quickly, but I do need
> complete representation. Please let me know if you'd like to participate
> and what day a meeting would work best for you. Those on copy should
> plan on attending or at least make sure someone is covering for your
> organization.
>
> Let me know if you have any questions.
>
> Regards, Kurt Taylor (krtaylor)
>
>
> Proposed times:
>
> 1) Tuesdays, 2:00pm Central US (1900 UTC)
>
> 2) Thursdays, 8:00am Central US (1300 UTC)
>
> 3) Thursdays, 3:00pm Central US (2000 UTC)
>

Hey Kurt, please sign me up.  I'd prefer one of the Tues/Thurs times.

>
> Initial Agenda:
>
> 1) Agree on the release process and set an initial release date in
> November (see email from May 21)
>
> 2) Set design and freeze milestones
>
> 3) "Must" deliver items for November release
>
> 4) How to open the design and development for a needed feature
>

Some misc topics I've had on my list in this area too:
- Along with number 3,4, once we've identified a feature, what's the
next steps from there?  Identify owning person or company?  Workgroup?
 Periodic updates in weekly call?  Is there a design template or
process we should follow to ensure community buy-in?  Should we have
some recommended staging dates (use cases, approved design date, test
plan, ...).
- Is there a way to be agile across companies when multiple companies
are contributing to a feature?  User stories, demo's/retrospectives?

Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="PraYCe4S"; 
 dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43jZfC6VHpzDqTP
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jan 2019 13:06:11 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id u47so21831191qtj.6
 for <openbmc@lists.ozlabs.org>; Sun, 20 Jan 2019 18:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VIzFPqPNM0nZutAD9UcI3JgMu+x5HcHgFZj4oXs+1LQ=;
 b=PraYCe4SbnB1Ne93+t+lKQAXp6YgRT/wVWGxhNIGBwvcN52y14H2QZUsOp20dOzBTB
 vv/lvNoHnWJhkX7U+/h3MM8wgBXdOwd2M5Vb7Ge6vqnTnwfv9kv6YElkY0VY9S//ndAL
 q4mbx6u0Q5nnw6Ql1wFZuOHS2boBzlTouxQy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VIzFPqPNM0nZutAD9UcI3JgMu+x5HcHgFZj4oXs+1LQ=;
 b=M6Ov8ZT3kAqj0ABOIr1OzChtGNUOLg6eLsjDU9mpLuNrfY8b4+jxQ2viZB+1/S9Ijt
 1bZTtn2sj7DkPxlthjPpod6nVW3iau126FVinIEJuWgPbTSX6YFcJx8DK8PvnFmmiVp5
 wWmxusR5SBr9QAvlHpfqUTNE5l22kXhkfHQuWb+dRa/wLvsROCtmOFChaLF+d+X9xVCk
 tj6iX5NiClkej/cM86J3TPFdLDpB05WymTZdkssuPimoIHo8z1/esXwVADBuXpHO24ha
 U5Su6Uu9goINVrdVRjhNNZWeF0DlXKFu45LX0jhpFlwif42w/ImuM/LsPTOhPqD7FgmR
 A9Ew==
X-Gm-Message-State: AJcUukclPQm0Es39eapzb+PhxHbcNw8y/l6nL/OcNEFUHudjCYPGGNAq
 LmNHelIosZmAIr0XoMhVrnJkuz9iapfeFFxuuCcenxg8mMI=
X-Google-Smtp-Source: ALg8bN5HW6WWabIf3OoQ6CEUQujnnnPBmKCXn5MHB3ywp+fIQZcbXBOEODvWvahizBHgcuMSX/WR/fy2dxMxDC3wFQE=
X-Received: by 2002:a0c:e751:: with SMTP id g17mr9798726qvn.160.1548036369398; 
 Sun, 20 Jan 2019 18:06:09 -0800 (PST)
MIME-Version: 1.0
References: <20190118021802.752bcjgc7oxa33m4@thinkpad>
 <20190118210913.a4kynzggtesqln5g@thinkpad>
In-Reply-To: <20190118210913.a4kynzggtesqln5g@thinkpad>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Jan 2019 13:05:57 +1100
Message-ID: <CACPK8XdJ36=APS3=-cA7cvVXsLOVmmf1ejF=GW5SZH7SOSe+HQ@mail.gmail.com>
Subject: Re: OpenBMC at the 2019 OCP Summit Hardware Management track
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Mon, 21 Jan 2019 02:06:12 -0000

On Sat, 19 Jan 2019 at 08:09, Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Thu, Jan 17, 2019 at 09:18:02PM -0500, Brad Bishop wrote:
> > Hi Everyone
> >
> > The TSC has asked me to present at the 2019 OCP Summit on behalf of the
> > OpenBMC community.  You can see the abstract here:
>
> https://github.com/openbmc/openbmc/wiki/files/OCPGLO19_OpenBMC_Project_Update-draft.pdf
>
> It is still very draft-y, but you can get a sense of the outline and
> high level flow.  I could use help calling out any function implemented
> in 2.6 and any function planned for 2.7.

Looks good.

If you wanted another slide you could talk about engagement with
upstream. One of most active upstreams is the kenrel. This is a good
graph to show how that work is going:

 https://ozlabs.org/~joel/patches.png

Cheers,

Joel

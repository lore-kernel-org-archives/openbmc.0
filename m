Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x232.google.com (mail-yw0-x232.google.com
 [IPv6:2607:f8b0:4002:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vrtCP5PgwzDq95
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 10:09:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VhGlmhXw"; 
 dkim-atps=neutral
Received: by mail-yw0-x232.google.com with SMTP id i203so20685656ywc.3
 for <openbmc@lists.ozlabs.org>; Sun, 26 Mar 2017 16:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=sIyygk70zP8nJCn9xa/5QndNGY/iUJePBL4nWcQitAg=;
 b=VhGlmhXwPwr5VVDHQZanEWgXvqvZHkLBh0mWdeI9Heax6qR6/HLz//koB5YnYsnQ04
 Mk5HBholRts5GU1k82Y2RIHTaHjrQt4+Yqdm6hmxKvo8lUEv3yK21WtYxz+eNFxe4NcK
 QHywMEefQFyPvfVU4s2N+n/C2G87XdUibiw+Ls8jFRa2kEnSlmN89920T9ElCgCgcx+a
 9d44i4SFRqC+/yy6MUnoo+WU227DEbXPqfXbXxvmoKzdJg1EviMkMxpUexzwzuLcGcco
 4z45rgB4FsJC3uyfgRCA27GsM1RVgYmPOuR94ujCPAWh22dnkExBOXljNzrHWvFQCZEC
 s7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=sIyygk70zP8nJCn9xa/5QndNGY/iUJePBL4nWcQitAg=;
 b=KSwntm1zFVue96Y73bprB+dVMrOzJMXD5psothQwKIIcBU1g9K45THWhH7Wu5hlEno
 hw3ZFiu6+YKgWuj2a15iz/5lqWYZHJwF/8XM7fAoN2SrNV1co6LtXNvinMEWUI3/7QGl
 5UsC86LZ3kWJGNAL1fMbSc3fOqIq3DUB6zUM+SutvEpSHa+ebOWQSTIehmUQC6+y0IJ1
 RFk949GfBXefxH5mmNF38CPtGfU2tbac+J3xUD5WzmWE8xOtP1qme7fYbPxFNqyj0o1b
 2ziaTqmioxkoDfKUIiY9hU/tYY9dg10qqFcU3l/1rhC3pjdtNv+jbzYX/CEwD5kmb6up
 FF6Q==
X-Gm-Message-State: AFeK/H3n3Yjy+ZhoPGgvXEXKIPxreDSwI3tZ5dSSMGxBtSEyVMJfblFCc927duZAqAszaTezqQ+hqj3tSHgSlw==
X-Received: by 10.37.165.67 with SMTP id h61mr14208992ybi.153.1490569774934;
 Sun, 26 Mar 2017 16:09:34 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.59.17 with HTTP; Sun, 26 Mar 2017 16:09:14 -0700 (PDT)
In-Reply-To: <CAPH-5w6apyUNVAVPqCXmPF_sBGSd_+=Y=kSHusXm8KJhx_7cCg@mail.gmail.com>
References: <20170323011926.176272-1-peterh@google.com>
 <CAPH-5w6apyUNVAVPqCXmPF_sBGSd_+=Y=kSHusXm8KJhx_7cCg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 27 Mar 2017 09:39:14 +1030
X-Google-Sender-Auth: R5xareBzR86KjBEyUsWwaBkoOuI
Message-ID: <CACPK8Xe-PmaVgcExBO2VhuK_QUXshVH-jv7uphvTteiSbSjmgw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: zaius: Enable 12V Delta Power Brick.
To: Xo Wang <xow@google.com>
Cc: Peter Hanson <peterh@google.com>, OpenBMC <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sun, 26 Mar 2017 23:09:38 -0000

On Sat, Mar 25, 2017 at 6:39 AM, Xo Wang <xow@google.com> wrote:
> On Wed, Mar 22, 2017 at 6:19 PM, Peter Hanson <peterh@google.com> wrote:
>> Signed-off-by: Peter Hanson <peterh@google.com>
>
> Reviewed-by: Xo Wang <xow@google.com>

Thanks. Applied to dev-4.7.

Cheers,

Joel

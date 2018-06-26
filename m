Return-Path: <james.mihm@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4002:c05::230; helo=mail-yw0-x230.google.com;
 envelope-from=james.mihm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nW+xPcBf"; 
 dkim-atps=neutral
Received: from mail-yw0-x230.google.com (mail-yw0-x230.google.com
 [IPv6:2607:f8b0:4002:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41FZpv28nwzF1Gt
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jun 2018 04:49:58 +1000 (AEST)
Received: by mail-yw0-x230.google.com with SMTP id k18-v6so6432949ywm.11
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jun 2018 11:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jyGvl6/rX/nbboL8cnflnG+snNXA+sZoW/3HzhaCxzU=;
 b=nW+xPcBfpY5Sf4HWKyG8C9zGmDk9eweMbWiV1wLVTjTpzgTEKDWxz2KfDoHg+2deID
 tZkesD4Uhpuj/LYrLVK2DhHmPr4ue5v73YWdDO9KfErYuIQlYc8F/gAmwfzkYFszhVEL
 uxZxFi65C40coezcbIV5XBjPEc7SCriG+itNLxI96vtKy/L1cxK8EgKtxwOznODAQnQH
 7S062xaHeq20K6dzYWffUogElonXAjhXMkWdIoDgf4egzQxbPuqIeyNSqXA2VyC/JNt2
 27Yg/wTmDY7G8zRePQCwxOgZueF4mA+Wk+pcW0qEBR9cHznArHrgp60PrLtjbOToNsjk
 X9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jyGvl6/rX/nbboL8cnflnG+snNXA+sZoW/3HzhaCxzU=;
 b=srSzPM5WsuaZtMn3sEYDhZDaE8fKUxhZCR2qNxIXL9bXp9YcG5kP9DoHhtYtcJL0rO
 qkWNddV+WkkY3ISDPMoOEDbOamaloWMTIBbZt5tD1jZ3IvJmesomkq7tSDo3KreFlxGM
 6nEtrjC8j0igGkf3TchhQ4mXqGWtgfeMAXhrtA4mo+cePl/1ilnkOMJkFt0x8a85GiHq
 eaXOCPF6UP4GkK3c8VTbKkPio22hMZPPligB2+eJMAHsGWwdPwwPWldBnNGQvzmvHbxk
 jDlBE0aXp6QkLEiiYuiIsN1FwDfZP2vlAkTn19cfhd6H63RHEe0v8IJKdJ3LaJzXTWGp
 axcQ==
X-Gm-Message-State: APt69E04uNO5IWblAbf8XGlbG63feof+c+EYfXk1J9oIoJFYZA/FSc1s
 2qxlpxEcUdvgnb979CU2TzKMgFi2HgpPD4z9PxQ=
X-Google-Smtp-Source: AAOMgpfYcwzl3SrQNb3KxuDrhl02oYdp1Ydct5Q+60cbwPmKAD6FKtM/KeSR4w9k92U/ZjlSw1W7bL5raBxOdEt+uiE=
X-Received: by 2002:a81:9152:: with SMTP id
 i79-v6mr1310922ywg.369.1530038996033; 
 Tue, 26 Jun 2018 11:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <19fe4e16-c014-3af8-ac1f-a73b446b379e@yadro.com>
In-Reply-To: <19fe4e16-c014-3af8-ac1f-a73b446b379e@yadro.com>
From: James Mihm <james.mihm@gmail.com>
Date: Tue, 26 Jun 2018 11:49:18 -0700
Message-ID: <CADy_Pt1P0Yv_GmHyHPsv6Wx-ML4JoYQ-HhOhc0+Dx-wTiKx3WA@mail.gmail.com>
Subject: Re: IPMI Adopter's agreement
To: a.amelkin@yadro.com
Cc: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Tue, 26 Jun 2018 18:50:00 -0000

I'm looking into how we need to proceed regarding this question
internally here at Intel.

James.
On Wed, Jun 20, 2018 at 9:33 AM Alexander Amelkin <a.amelkin@yadro.com> wrote:
>
> Just wondering, does OpenBMC / TLF have this fine document signed?
>
> https://www.intel.com/content/www/us/en/servers/ipmi/ipmi-home.html/#adopters
>
> Or does each vendor need to sign this separately?
>
>
> Sincerely,
> Alexander.
>
>

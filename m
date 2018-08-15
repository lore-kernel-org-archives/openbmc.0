Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::231; helo=mail-io0-x231.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kSpHBZsx"; 
 dkim-atps=neutral
Received: from mail-io0-x231.google.com (mail-io0-x231.google.com
 [IPv6:2607:f8b0:4001:c06::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41qtMk6YT8zF1RN
 for <openbmc@lists.ozlabs.org>; Wed, 15 Aug 2018 12:14:58 +1000 (AEST)
Received: by mail-io0-x231.google.com with SMTP id m4-v6so19356488iop.3
 for <openbmc@lists.ozlabs.org>; Tue, 14 Aug 2018 19:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x3wayOfxXXImUOEsHw2aKhnjzDIepfu/faNh6SlDk08=;
 b=kSpHBZsxHAAL6hMod8I+WGIQbmAVYz2yeSZUXuvB8moXM7+uzLFXLdbI/GazzWvJOG
 GajuEcT5oRlg4uUxaG1OhANWD7F1pQZs+1PRp3EUB1Di7LAe+TsFkUWfBWru/0q5wMg1
 poX6WWpzPtGbcZ3a9gX/l5jBG8IGbS/ljczDEBgk7Q7IzcB76uShP+z20o1dimeWIWO/
 V4CdYgg4GH+q8tGEaxYv9b2ylBbOkDxCxe+qLX9Hq20jaEZlqycm+CMymGPV+aPM/ydX
 45dYy25FlhOkeJX20EgNnECuU9XSE3Z0n3k7oGYpksIils7I1IlBGmmOWzyH8XqARBLC
 6WkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x3wayOfxXXImUOEsHw2aKhnjzDIepfu/faNh6SlDk08=;
 b=U+mMlghplQW7+w9Xan77YL+7fZLQF8FIDFUSZaq5D5Q6hChcvmNuOjux+CMoqYVWh+
 6b1mU9Kl18FLh7vCTw4Qp8d6zuL05kRggAu7ZpkKeayWwzUhrDQBRDadz9rtTElwn4/t
 1zFdIZnVu4kHl/aism0Dci6xGVieKYmk4Sbvt+0BFWrqSD7r261X7rdZgCRev7M+oaau
 6jrc02r1llW3toWHCgtygoS5uAdCeuyb86zt0WytInNxAhPid8GqT+5zHbAYTmK7CTfG
 WWuXQhEp3FHJtV77rAkg1o62inWbHDng5EydpjqD4kLUFUXTP0s6Botdu8EBNX7VGpLQ
 OQNw==
X-Gm-Message-State: AOUpUlHL41X6xpne8MIofhoe8Hjinhn9a7giC3qLGnGTWXx34JTXkMnG
 /86Bzw35bSfe5GMSKGiBKUylY54U/t4pWXpZmYI=
X-Google-Smtp-Source: AA+uWPy/47mwNx/4gw9C+Sjef8PzK7KqE/8Aslb4ehg1Sr+Pjao1/xHSaAHfN9aov9GQlr+eDMj+Z+wHClG47ozaZcg=
X-Received: by 2002:a5e:8414:: with SMTP id
 h20-v6mr5871037ioj.171.1534299296346; 
 Tue, 14 Aug 2018 19:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <11b98338b00640daa3cbeba50c6ef324@yadro.com>
 <33ffdf42-0d9d-0331-0e14-2898cd1a1e73@yadro.com>
In-Reply-To: <33ffdf42-0d9d-0331-0e14-2898cd1a1e73@yadro.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 15 Aug 2018 10:14:41 +0800
Message-ID: <CAARXrtmmeixPcYx4U11Zy19fm0GnOLbvUD2MTpZOEp-ytQ9T2g@mail.gmail.com>
Subject: Re: Version and Functional FRU fields for motherboard and membuf
To: Sivas Srr <sivas.srr@in.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 15 Aug 2018 02:14:59 -0000

> It's actually "Verify FRU Properties" and it's a part of openbmc-test-automation test suite, see here:
>
> https://github.com/openbmc/openbmc-test-automation/blob/ac687c43ddc7f639a4607ad89dd5ae462dcf65c9/tests/test_inventory.robot#L184
>
> As I see, Palmetto's yaml config does not have Version or Functional property for motherboard and membuf, so I do not think they will have such properties.
>
> So, does the test case pass for Palmetto?

@Sivas Srr Could you check this?

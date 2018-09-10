Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IkCQurvz"; 
 dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 427zc40FnszF38t
 for <openbmc@lists.ozlabs.org>; Mon, 10 Sep 2018 17:06:27 +1000 (AEST)
Received: by mail-io1-xd35.google.com with SMTP id e12-v6so6178643iok.12
 for <openbmc@lists.ozlabs.org>; Mon, 10 Sep 2018 00:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3cnmqMQTNSJrurn1VaCJDa8CqZ8JZyVss5bgtIJLm6g=;
 b=IkCQurvzxMcB1mRhV6yz/gxOMWijlzAlgFsf/gl2YTG1oSQHYbyl7RwYnVhYEsIuia
 h+g94l99KiA4uUrH9aYlOsTOzejYp+PdaDU5kIh/wrBctM3iio76Vi6mTH9wsjnmzWFu
 zVuNm40UeFXcGiasGTPCmJvmvLRDlHvRdWHQLt3yxdFr6fRXgJxUCTvZ6egyzu+e38E6
 xQpAQiGoUU8nyOuRhmn7ULdcSQIZIsgTG9EimizmRejtiSklynqk46bO3hRM/2g+vqrs
 AJ+LNyxKW//kiz/ptY7+QPC526Wjyu6lECr9jOy02nyIu1LoKF5gfd22Xob4hm/PvB60
 ijyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3cnmqMQTNSJrurn1VaCJDa8CqZ8JZyVss5bgtIJLm6g=;
 b=nLA2Yp5K+/jJvZlQzKzowhVNee+Rjzi+mX5jV2svRvjRnir7CuN2PHu+RF5uUsC8IK
 d7UwPSFlA4JbIybFJ9Vxa54bS6l7Xn9qgUvKYwvoBhANqp77a7sHa/3GeWoIAVnOuBdZ
 OSzd35nDRvEPgoGRYsQj9FYvc7ugfAPREyFW3wfTb8OiMReksvhn+nxk/AXZ4V9WcWpP
 VxkrAJfRfHbZWO97dCcN4NTESJWzxvFI0YxsoOic/HpzcgyEzbkP+NRZSWowMHGhotWu
 jBQjg2NzkpwZd46M9DhAHNRPY6bzo7gr4/BngBohpl0ObK9Yz0FxJ4S6WbCPIKG/3qpa
 w6wg==
X-Gm-Message-State: APzg51C91IQ2wxW0aDbf4Yr6iSSsh/J1Ao3VaikQLYu0A78SW68HiUl0
 oJoTbDne3H5KOjhTas97pniMgRKj7u3FtAIlmIcO6VPd
X-Google-Smtp-Source: ANB0Vda/JFPbFYFd9Um9l/jqRf0AnAlY3WZvDAK0BUsTeeHkc8ipq/RHjkmfP5nTIsN35cPBnGdFT4WP4mEQx064Dgs=
X-Received: by 2002:a6b:8d0f:: with SMTP id
 p15-v6mr15612031iod.98.1536563184613; 
 Mon, 10 Sep 2018 00:06:24 -0700 (PDT)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Mon, 10 Sep 2018 15:06:00 +0800
Message-ID: <CAARXrtk8AMsdTfAszZQozpsMUU-JckZmx6Pa7cvYnyD5cgLzVw@mail.gmail.com>
Subject: C++17 support?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 10 Sep 2018 07:06:29 -0000

Now we are using GCC 7.3 and it has full C++17 support, although it is
[experimental][1]

Is it suitable for a product to use C++17 instead of C++14 in repos?

The reason I am asking is because phosphor-time-manager got a build error when
enabled with LinkTimeOptimization, related to an undefined reference to a
`static constexpr char*`, and it could be avoided if I change to use C++17 to
compile, because constexpr implies inline in C++17 and it fixes the issue.
So I would like to use C++17 in this repo, which then does not require any
code change to enable LinkTimeOptimization.

Be noted that although we are using C++14, some repos are using C++17 features
in std::experimental namespace already, e.g. std::experimental ::filesystem.

[1]: https://gcc.gnu.org/projects/cxx-status.html#cxx17

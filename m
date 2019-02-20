Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mR9gMSgB"; 
 dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 444R6Z0wmNzDq8X
 for <openbmc@lists.ozlabs.org>; Thu, 21 Feb 2019 05:32:37 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id o6so12637761pls.13
 for <openbmc@lists.ozlabs.org>; Wed, 20 Feb 2019 10:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pvEGLBUBcpalbeosHncyfXOVumOdX99L3tnSE2LnOXI=;
 b=mR9gMSgBOzk60o8Ob8VluzJWg56Dpm05OAKVqZtoE9OD5Xq0WlentfRbJNiHRT1PqV
 0jkP0RJZmyLm5lbREbZgTuFCosCEH6uA9bNhUoFsG8pW1KztXnEV3doWQw0tqCWLFjzM
 YLRS0qkXzWTKepnqxQXCwEIR/lqODPNe2paj1jBpAMOPDNoKUQx47weuV16SfyPRGKbx
 Nt+rPt3GtoCKqoNbFSmACaVMFShdYv+nj1rDLzV5wLGIqQCIfrAVaNItFThOUOqIj6op
 PHJZnudZwjeqQSjjVdG68AMAghogozi6W1Dzc6/tS9MYd7p9mOyBAjndYGHv/qPXn7IS
 saGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pvEGLBUBcpalbeosHncyfXOVumOdX99L3tnSE2LnOXI=;
 b=SKt/InK4YE4TuS752rI43Tq3/l6nFZO1b3l6n3YBh/TJdB3BMjK/FMGCwkpMH8RBCD
 fQPfCzDJe5oCMOvxaaBcL0kdpotRyc0rZ8XAbIxPxy0UnwN2nL2IX6w5sbknCbpJ/pIg
 YaYJYhwzJqlEZ1BVNCx4JqgIrFzPS1cFjjOykLsZB2zfO0up8bD84qQD5m/xmdadczhS
 j5891nbxC8bb5eGhRsPaVRtIgNJMLWHqeFmbljOcev7+A1bOUn09PmfvCBhkXFYlC3QX
 8ZvOCjKFB55aNLxQ5uPsw+UZfWyxiDdUkApcLpyZcTIM8O7WN0H0gM0q8LaYqysmykkR
 UAzw==
X-Gm-Message-State: AHQUAuZurGad8TenIls8HCPq1ORUow7sOuvnwP9QPEGukwI9iFedY9EW
 CBaAsAg09kwZAuYWC1Wxdo853SrKZJ6CmNfftcrOpQ==
X-Google-Smtp-Source: AHgI3IY+qtxdOiCB/ZOaaDY8tI1XhWj/TtKzDso1iVSrd11FRv6X9XLL22iUIKg0Ao0TBMnnOmROFKYb1f/YDCJpy+Y=
X-Received: by 2002:a17:902:684:: with SMTP id 4mr37781994plh.3.1550687555636; 
 Wed, 20 Feb 2019 10:32:35 -0800 (PST)
MIME-Version: 1.0
References: <23eeb05bb818341a140e51ff183109ba@linux.vnet.ibm.com>
In-Reply-To: <23eeb05bb818341a140e51ff183109ba@linux.vnet.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 20 Feb 2019 10:32:24 -0800
Message-ID: <CAO=notyk=xCUzcqJcMfvpAJx=dNgAw=_pudiTHX74iw1_eAr4w@mail.gmail.com>
Subject: Re: sensor->inventory associations in phosphor-hwmon
To: Matt Spinler <mspinler@linux.ibm.com>
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
X-List-Received-Date: Wed, 20 Feb 2019 18:32:39 -0000

On Wed, Feb 20, 2019 at 10:31 AM Matt Spinler <mspinler@linux.ibm.com> wrote:
>
> Hi,
>
> We have a need to know which sensor objects hosted by the various
> phosphor-hwmon
> daemons belong to which inventory objects.  For example, we need to know
> that
> the /xyz/openbmc_project/sensors/power/ps1_input_power sensor belongs to
> the
> /xyz/openbmc_project/inventory/system/powersupply1 item.
>
> To accomplish this, I am proposing we add a new environment variable to
> the
> system specific phosphor-hwmon config files that the phosphor-hwmon code
> can then use to create associations interfaces that will cause the
> mapper to
> create the appropriate association D-Bus paths.
>
> As an example, we could add to the power-supply1 conf file an
> ASSOCIATIONS
> variable for each sensor (assuming ps1_input_power is represented by
> IN1):
>
>      ASSOCIATIONS_IN1=/xyz/openbmc_project/inventory/system/powersupply1
>
> The code would then see that and create a new org.openbmc.Associations
> interface
> on the /xyz/openbmc_project/sensors/power/ps1_input_power path with an
> associations property of:
>
>      ["inventory",
>       "sensors",
>       "/xyz/openbmc_project/inventory/system/powersupply1"]
>
> This leads to the mapper creating:
>
>      /xyz/openbmc_project/sensors/power/ps1_input_power/inventory
>
> With an xyz.openbmc_project.Association interface with an
> endpoints property of:
>
>      ["/xyz/openbmc_project/inventory/system/powersupply1"]
>
> And also the other association path:
>
>      /xyz/openbmc_project/inventory/system/powersupply1/sensors
>
> With an xyz.openbmc_project.Association interface with an
> endpoints property of:
>
>      ["/xyz/openbmc_project/sensors/power/ps1_input_power"]
>
> This now allows one to both find all sensors associated with a power
> supply, and
> find which inventory item is associated with a particular sensor.  Note
> that
> the endpoints property is an array, and can get entries from multiple
> places.
>
> I suppose we could also put the forward/reverse association names, in
> this case
> "inventory" and "sensors", into the hwmon config file, and also allow
> creating
> multiple associations for each sensor if there is a usecase, though I
> would like
> to keep it as simple as possible:
>
> ASSOCIATIONS1_IN1=inventory,sensors,/xyz/openbmc_project/inventory/system/powersupply1
> ASSOCIATIONS2_IN1=chassis,contained_sensors,/xyz/openbmc_project/inventory/system/chassis
>
> What does everyone think?

I think it's useful and straightforward to use, and easy to test.

>
> Thanks
> Matt
>

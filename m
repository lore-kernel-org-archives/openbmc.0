Return-Path: <raltherr@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::234; helo=mail-ua0-x234.google.com;
 envelope-from=raltherr@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dL1ZWBck"; 
 dkim-atps=neutral
Received: from mail-ua0-x234.google.com (mail-ua0-x234.google.com
 [IPv6:2607:f8b0:400c:c08::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xn1zW52FyzDqYG
 for <openbmc@lists.ozlabs.org>; Wed,  6 Sep 2017 08:46:31 +1000 (AEST)
Received: by mail-ua0-x234.google.com with SMTP id k23so10975629uaf.4
 for <openbmc@lists.ozlabs.org>; Tue, 05 Sep 2017 15:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=UYGnVTy8tgKFgv71PCtcKG0PGDT9SGxEutOLEIdSOZA=;
 b=dL1ZWBckOcwAkcS50HSIYktSmuqfTGG2qCxRSJ7yFE6LNS+/7WDhM9APxj9noPR872
 nQteYng1fsY77BXitWJkwVrkGERPha2NTXLrvN3V0Z8X1uIto9/jnRSz1J3BG8QPKtmm
 DAGh34tMbwL3fqznj4+R9PGNPHazB60pcDQfdIVW1j92YEMqaQ2aXOeBgGRTvVvNI4wm
 abIgwa/aQTaXLQ4mbJii4bOySJIyUgpT89L1W66GcoLPd/sKuKMCS0UIVX2Z0tA9+2RJ
 9oaUGmUUTlj7HcLvcS+scEnV46EVguaIJLpIN6/ggPnWUeVCmcqsZ3v0Izbhso3phDGc
 XSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=UYGnVTy8tgKFgv71PCtcKG0PGDT9SGxEutOLEIdSOZA=;
 b=RF6YtXl7UoE9KmZY8kcgoUpUpiVtyqCqqaVAGPQ2D/+YivPhZurmXvuD7X2EDlesam
 ab8SwicV1978qhSrC93mXw2JjNlX1RtwVWbJcO71DBTg4vp1wV1lyobN/YjN2l5cYviK
 654r6tVjRfALs6/FLebpjYWEIwaRTrgAJTE6SMUBAbsTlNEZm+UOVPXskXTdJ1fch5Y4
 oifmgWgaPU8PrmGKGe2qUiLhQ8QwhZZbCi8wUBdBBya3y4a5lnezzfAScBw7uVhSbqkP
 LNqX9EqywC00YJLJwsbN0clJB6EJg49qBHfB/WqfsWev6U8vdTMg2moCryu5/ciKst6q
 BnIA==
X-Gm-Message-State: AHPjjUj2Gwm0lS/g80MnfOuCbQn9OKF8aMywYNK/6GRkNNJvDpETNIBB
 +ss4FL1HZmKj1tX1g6nfSO+0l6q8qqPW
X-Google-Smtp-Source: ADKCNb7+lCylfmaAMfIz6E/SXclyOvyaZPsWkQ3Auk8IOVtRJza24jCkYsdHiKszUbbBeD6sv9rPGk6KRpR5e5ooMF4=
X-Received: by 10.176.21.129 with SMTP id i1mr435088uae.142.1504651587820;
 Tue, 05 Sep 2017 15:46:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.135.142 with HTTP; Tue, 5 Sep 2017 15:46:27 -0700 (PDT)
In-Reply-To: <066b3313-6516-2c05-6c67-4b8d26b50401@linux.vnet.ibm.com>
References: <066b3313-6516-2c05-6c67-4b8d26b50401@linux.vnet.ibm.com>
From: Rick Altherr <raltherr@google.com>
Date: Tue, 5 Sep 2017 15:46:27 -0700
Message-ID: <CAPLgG=nhGsZ4_TEz0RoG9cxBs9=L796URuYnpL2buBA8ciVFgA@mail.gmail.com>
Subject: Re: RFC for event logging mechanism
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 05 Sep 2017 22:46:32 -0000

On Tue, Sep 5, 2017 at 4:24 AM, Deepak Kodihalli
<dkodihal@linux.vnet.ibm.com> wrote:
> Hello,
>
> I'm working this sprint on designing an event logging mechanism
> (https://github.com/openbmc/openbmc/issues/1856). I have a couple proposals
> below along with some questions. Hoping to hear thoughts on which might be a
> better proposal. Any other feedback is welcome.
>
> Potential requirements
> 1) Applications should be able to log events of interest. Events could be
> used for purposes such as telemetry, analytics, debug. Examples of events
> could be changes in the power/thermal domain, such as operating temps on a
> server, boot related, user account changes, etc.

My experience at Google is that telemetry and debug, while both
event-oriented, have vastly different usages which lead to different
designs.  Telemetry like temperature, voltage, current, boot count,
f/w version are primarily collected, aggregated, and analyzed by
automation systems.  To avoid complexity in the consumers of that
data, it is ideally self-describing, easily parsable, and in the most
intuitive, primitive form.  Our internal systems use explicit types
and generous metadata for _each_ piece of telemetry.  For example, a
voltage sensor is encoded as a float with metadata describing the rail
being monitored, units (mV or V), time recorded, etc.  I expect these
to be consumed as they are generated, either by local processes or by
streaming off-machine.

Debug is almost exclusively consumed by humans in cases where a
problem has already been found and the relevant data for identifying
the root cause is not in the telemetry and unknown.  I think of debug
as being comprised mostly of unstructured logs.  Off-machine
collection can be done infrequently and in bulk.

All attempts I've seen to mix the two has lead to a messy API and/or
data model.  Even if the data model and API _can_ be shared, the
higher-level consumers of the two types of data will be different.
Instead of requiring the client to know which are telemetry and which
are debug logs, separating that into two APIs makes the consumer's
life simpler.

> 2a) Users should be able to query events via REST.
> 2b) Users should also be able to query events of a certain category or type.
> 3) Users should also be able to "download" events in a format such as JSON
> (This comes for free today with the rest server running on OpenBMC).
> 4) It should be possible to specify event metadata, which may have use for a
> human as well as a program.
> 5) It should be possible to persist events up to a certain cap.
>
>
>
> Proposal 1 - Leverage existing OpenBMC phosphor-logging
>
> Phopshor-logging works as a supplement to journald - at a high level it
> makes it possible to log errors to the journal, as well as create d-bus
> objects representing the errors.
>
> - Phosphor-logging uses the Entry interface [1] to describe an error. I have
> [2] as the proposed Event interface. It's mostly similar to [1] -
> differences being - I wasn't sure if we really need event severity and
> resolution, plus having an event Category would be handy for handling
> Requirement 2b).
>
> - Phosphor-logging requires describing errors in yaml (error yaml and error
> metadata yaml), which are processed [3] by a script that generates an error
> log API, which clients can use. The API is part of a phosphor-logging client
> lib. The same yaml structure can be utilized for events, maybe with the yaml
> files themselves being named slightly differently to depict events and event
> metadata instead of errors. This means the client lib will have an event
> API, similar to the existing elog API [6]. Error yaml files are stored
> either in the phosphor-dbus-interfaces repo, or within an application's
> repo, based on whether the error corresponds to a d-bus interface failure or
> not. In case of events, I think the event yaml files can just be stored in
> the app that creates them.
>
> - The event logging API, in addition to logging to journal, will call an
> internal phosphor-logging d-bus API, similar to [4], in order create a d-bus
> object depicting the event. Based on the event Category, the d-bus object
> will be placed in the right namespace, such as
> /xyz/openbmc_project/logging/events/boot/ or
> /xyz/openbmc_project/logging/events/thermal/. The phosphor-logging process,
> hence, will own these d-bus objects, do the id management (per category),
> etc.
>
>
>
> Proposal 2 - Write d-bus interfaces to describe events
>
> Couple of issues I see with Proposal 1 :
>
> a) It's cumbersome for a BMC app to figure out that a specific event was
> reported, or to express interest in a certain category of events. The d-bus
> path namespace can help to a certain extent here though, but it's based on
> paths and properties and not interfaces being added.
> b) Both the existing Entry interface [1] and the proposed Event interface
> [2] express metadata as strings, probably not the most elegant way for an
> interested program to deal with them.
>
> Given this, it feels more natural to express an event in it's own d-bus
> interface, such as an Event.Boot or Event.Thermal interface. So, this
> proposal looks like :
>
> - Define an Event log interface [5]. Note that this is mostly like [2],
> although it has an additional method to create the event d-bus object.
>
> - For specific event types, define their own d-bus interfaces. I don't have
> examples for these at the moment, but like I mentioned above, we could have
> interfaces for Event.Boot and Event.Thermal to start with. These interfaces
> could be placed in the phosphor-dbus-interfaces repo. A phosphor-logging
> application will have the code to implement these well-known event
> interfaces, and to basically create d-bus objects. This app will also
> implement the "Notify" method defined in [5].
>
> - An application interested in reporting an event will make a call to the
> "Notify" API defined in [5], stating the event category and the event
> metadata. The phosphor-logging application that implements "Notify", will
> create d-bus objects based on the event Category and metadata, and place
> them in appropriate d-bus path namespaces, similar to Proposal 1. It can
> also log the event information to the journal, though I am not sure why this
> would be required, aside from the having the need to have the journal as the
> repo of all events.
>
>
>
> [1]
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Logging/Entry.interface.yaml
> [2] https://gerrit.openbmc-project.xyz/#/c/6405/1
> [3]
> https://github.com/openbmc/phosphor-logging/blob/master/tools/elog-gen.py,
> error yaml example :
> https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Dump
> [4]
> https://github.com/openbmc/phosphor-logging/blob/master/log_manager.cpp#L27
> [5] https://gerrit.openbmc-project.xyz/#/c/6406/1
> [6]
> https://github.com/openbmc/phosphor-logging/blob/master/phosphor-logging/elog.hpp#L126
>
> Regards,
> Deepak
>

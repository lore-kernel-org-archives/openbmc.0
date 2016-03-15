Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPG226V97zDq6y
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 11:38:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=svEnezbe; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id n5so290681pfn.1
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2016 17:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VMOQZIvR+0DTepq0vuS8BZGRMnL/1xJ9BYwktgx9H0Q=;
 b=svEnezbeafkfCg3fwPv1IsEtYCfuSgqM/w1HtsmjDzIH6NDCu29SNGS34x2ScV+l+g
 AfZgw7AbQtrNBbUEhsVLyXPSq+QzYilNZeRgqvmjVGhMjvvYDc6+VCB0iKo/ALoXBY5K
 NMkpIjWhJ0GTT2chbhtl6sLY2RfIy5FL0t2OeWwApDe9/HF2i6j5WSixt/8RL3oOJj9s
 wFvgBCz05TMktSLeRdclb2LCuSGAu5Lbj3bLvNlbQUEnweWrYA1mrJ6jAy+8jLiu1pTq
 zS846OsMlRO5+ICYU3nA9jG4fCNRtWrnFCKRKOFSA0CFPO2wcLMdaWTkEIKmRE5LEtZM
 xqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VMOQZIvR+0DTepq0vuS8BZGRMnL/1xJ9BYwktgx9H0Q=;
 b=HIsPmsA8ZKZ9yXiJ2wIRpdu5jvupw18QtoCygDcOIAaSjiqaRdXpnu36bK80KRGJC5
 kl6AoWoSzhF+16gXeynZnxwMf/6H5Rrid+YlD7jRM+eTCKp0F6LZyIZoTjACUgfU9K2p
 BPS3qwhvlolrRxRCde+593bSjhq2xCYT6vjEZMGn1joG0vCUeaj7FjApLmbxGv7i/74+
 uiMgtvl8l9JEtRfQ3CwS0k4c0b5uV4mL1cImuq37m9EfyB5KFR+utY3wjor2LAXL+IKv
 roA26bZ3gY3J+Opu7L7DzViI+WSOrjW8nISAfYzGGTU4zTV6/yTtB6Cg8ghrXVHrPWSr
 4Gww==
X-Gm-Message-State: AD7BkJLaKEAfkzs4X6ij3CVsxMjiVpY7xX5d5tvN2FSwshogE/x2q50bllhj3fap4snowQ==
X-Received: by 10.98.12.83 with SMTP id u80mr34081441pfi.116.1458002313155;
 Mon, 14 Mar 2016 17:38:33 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 62sm2389995pfk.83.2016.03.14.17.38.30
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 14 Mar 2016 17:38:32 -0700 (PDT)
Date: Tue, 15 Mar 2016 11:38:21 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: austenc@us.ibm.com
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-event v4 1/2] Add association interface to each
 event log
Message-ID: <20160315113821.23950abd@camb691>
In-Reply-To: <1457736030-6801-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457736030-6801-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457736030-6801-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Mar 2016 00:38:35 -0000

On Fri, 11 Mar 2016 16:40:29 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Chris Austen <austenc@us.ibm.com>
> 

Hi Chris,

It is customary to put what has changed between different revisions of
the patch. So that the 'changelog' doesn't end up in the commit message
or the code, either a coverletter can be used or it can be put after the "---"
below (git will ignore that text).

Using github pull requests might make the "---" method hard... I don't
know github all that well, is there a feature we can use?

Also, is v4 different from v3?


Two more things below,

Thanks,

Cyril
> When a new event log is created we will create an interface
> with a name of org.openbmc.association.  That will have a
> single property named "association" which will be an a(sss).
> That will be enough information for the rest server to present
> it.
> 
> Lets say you want to run the acceptTestMessage method.  It
> will create an association between the event log and 2 dimms.
> 
> So
> /org/openbmc/inventory/system/chassis/motherboard/dimm2
> /org/openbmc/inventory/system/chassis/motherboard/dimm3
> 
> /org/openbmc/records/events/1/fru
> should return
> data : {/org/openbmc/inventory/system/chassis/motherboard/dimm2 , /org/openbmc/inventory/system/chassis/motherboard/dimm3}
> 
> You should also be able to go to the dimm and get the association in reverse
> 
> /org/openbmc/inventory/system/chassis/motherboard/dimm2/event
> should return
> data : {/org/openbmc/records/events/1/}
> 
> Fix warnings due to invalid number of parameters
> 
> you cant have a fprintf with two parms but only one %s.
> ---

If not github, here is the customary place, for example:
Version X:
          ...
Version Y:
          ...

>  event_messaged_sdbus.c | 105 ++++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 86 insertions(+), 19 deletions(-)
> 
> diff --git a/event_messaged_sdbus.c b/event_messaged_sdbus.c
> index fc4c911..907ac53 100644
> --- a/event_messaged_sdbus.c
> +++ b/event_messaged_sdbus.c
> @@ -1,3 +1,4 @@
> +#define _GNU_SOURCE
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <errno.h>
> @@ -20,6 +21,7 @@
>  /*     method_x  : callable dbus functions.                                  */
>  /*                                                                           */
>  /*****************************************************************************/
> +const char *event_path = "/org/openbmc/records/events";
>  
>  sd_bus      *bus   = NULL;
>  sd_bus_slot *slot  = NULL;
> @@ -31,6 +33,7 @@ typedef struct messageEntry_t {
>  	size_t         logid;
>  	sd_bus_slot   *messageslot;
>  	sd_bus_slot   *deleteslot;
> +	sd_bus_slot   *associationslot;
>  	event_manager *em;
>  
>  } messageEntry_t;
> @@ -84,6 +87,53 @@ static event_record_t* message_record_open(event_manager *em, uint16_t logid)
>  	return (r ? gCachedRec : NULL);
>  }
>  
> +static int prop_message_assoc(sd_bus *bus,
> +			const char *path,
> +			const char *interface,
> +			const char *property,
> +			sd_bus_message *reply,
> +			void *userdata,
> +			sd_bus_error *error)
> +{
> +	int r=0;
> +	messageEntry_t *m = (messageEntry_t*) userdata;
> +	event_record_t *rec;
> +	char *p;
> +	char *token;
> +
> +	rec = message_record_open(m->em, m->logid);
> +	if (!rec) {
> +		fprintf(stderr,"Warning missing evnet log for %lx\n", m->logid);

Oops, that typo snuck past me. s/evnet/event/

> +		sd_bus_error_set(error,
> +			SD_BUS_ERROR_FILE_NOT_FOUND,
> +			"Could not find log file");
> +		return -1;
> +	}
> +
> +	p = rec->association;
> +
> +	token = strtok(p, " ");
> +	if (token) {
> +		r = sd_bus_message_open_container(reply, 'a', "(sss)");
> +		if (r < 0) {
> +			fprintf(stderr,"Error opening container %s to reply %s\n", token, strerror(-r));
> +		}
> +
> +		while(token) {
> +
> +			r = sd_bus_message_append(reply, "(sss)", "fru", "event", token);
> +			if (r < 0) {
> +				fprintf(stderr,"Error adding properties for %s to reply %s\n", token, strerror(-r));
> +			}
> +
> +			token = strtok(NULL, " ");
> +		}
> +
> +		r = sd_bus_message_close_container(reply);
> +	}
> +
> +	return r;
> +}
>  
>  
>  static int prop_message(sd_bus *bus,
> @@ -103,7 +153,7 @@ static int prop_message(sd_bus *bus,
>  
>  	rec = message_record_open(m->em, m->logid);
>  	if (!rec) {
> -		fprintf(stderr,"Warning missing evnet log for %d\n", m->logid);
> +		fprintf(stderr,"Warning missing evnet log for %lx\n", m->logid);
>  		sd_bus_error_set(error,
>  			SD_BUS_ERROR_FILE_NOT_FOUND,
>  			"Could not find log file");
> @@ -114,8 +164,6 @@ static int prop_message(sd_bus *bus,
>  		p = rec->message;
>  	} else if (!strncmp("severity", property, 8)) {
>  		p = rec->severity;
> -	} else if (!strncmp("association", property, 11)) {
> -		p = rec->association;
>  	} else if (!strncmp("reported_by", property, 11)) {
>  		p = rec->reportedby;
>  	} else if (!strncmp("time", property, 4)) {
> @@ -174,7 +222,7 @@ static int method_accept_host_message(sd_bus_message *m,
>  				      void *userdata,
>  				      sd_bus_error *ret_error)
>  {
> -	char *message, *severity, *association, *s;
> +	char *message, *severity, *association;
>  	size_t   n = 4;
>  	uint8_t *p;
>  	int r;
> @@ -201,9 +249,7 @@ static int method_accept_host_message(sd_bus_message *m,
>  	rec.p           = (uint8_t*) p;
>  	rec.n           = n;
>  
> -	asprintf(&s, "%s %s (%s)", rec.severity, rec.message, rec.association);
> -	syslog(LOG_NOTICE, s);
> -	free(s);
> +	syslog(LOG_NOTICE, "%s %s (%s)", rec.severity, rec.message, rec.association);
>  
>  	logid = message_create_new_log_event(em, &rec);
>  
> @@ -234,10 +280,7 @@ static int method_accept_test_message(sd_bus_message *m,
>  	rec.n           = 6;
>  
>  
> -	asprintf(&s, "%s %s (%s)", rec.severity, rec.message, rec.association);
> -	syslog(LOG_NOTICE, s);
> -	free(s);
> -
> +	syslog(LOG_NOTICE, "%s %s (%s)", rec.severity, rec.message, rec.association);
>  	logid = message_create_new_log_event(em, &rec);
>  	send_log_to_dbus(em, logid);
>  
> @@ -261,7 +304,7 @@ static int method_clearall(sd_bus_message *m, void *userdata, sd_bus_error *ret_
>  
>  	while (logid = message_next_event(em)) {
>  		snprintf(buffer, sizeof(buffer),
> -			"/org/openbmc/records/events/%d", logid);
> +			"%s/%d", event_path, logid);
>  
>  		r = sd_bus_call_method_async(bus,
>  					     NULL,
> @@ -305,7 +348,6 @@ static const sd_bus_vtable recordlog_vtable[] = {
>  
>  static const sd_bus_vtable log_vtable[] = {
>  	SD_BUS_VTABLE_START(0),   
> -	SD_BUS_PROPERTY("association", "s",  prop_message,    0, SD_BUS_VTABLE_PROPERTY_CONST),
>  	SD_BUS_PROPERTY("message",     "s",  prop_message,    0, SD_BUS_VTABLE_PROPERTY_CONST),
>  	SD_BUS_PROPERTY("severity",    "s",  prop_message,    0, SD_BUS_VTABLE_PROPERTY_CONST),
>  	SD_BUS_PROPERTY("reported_by", "s",  prop_message,    0, SD_BUS_VTABLE_PROPERTY_CONST),
> @@ -321,13 +363,18 @@ static const sd_bus_vtable recordlog_delete_vtable[] = {
>  	SD_BUS_VTABLE_END
>  };
>  
> +static const sd_bus_vtable recordlog_association_vtable[] = {
> +	SD_BUS_VTABLE_START(0),
> +	SD_BUS_PROPERTY("associations", "a(sss)",  prop_message_assoc, 0, SD_BUS_VTABLE_PROPERTY_CONST),
> +	SD_BUS_VTABLE_END
> +};
> +
>  static int remove_log_from_dbus(messageEntry_t *p)
>  {
>  	int r;
>  	char buffer[32];
>  
> -	snprintf(buffer, sizeof(buffer),
> -		"/org/openbmc/records/events/%d", p->logid);
> +	snprintf(buffer, sizeof(buffer), "%s/%lu", event_path, p->logid);
>  
>  	printf("Attempting to delete %s\n", buffer);
>  
> @@ -338,6 +385,7 @@ static int remove_log_from_dbus(messageEntry_t *p)
>  	}	
>  	sd_bus_slot_unref(p->messageslot);
>  	sd_bus_slot_unref(p->deleteslot);
> +	sd_bus_slot_unref(p->associationslot);
>  
>  	message_entry_close(p);
>  
> @@ -350,8 +398,7 @@ int send_log_to_dbus(event_manager *em, const uint16_t logid)
>  	int r;
>  	messageEntry_t *m;
>  
> -	snprintf(loglocation, sizeof(loglocation),
> -		"/org/openbmc/records/events/%d", logid);
> +	snprintf(loglocation, sizeof(loglocation), "%s/%d", event_path, logid);
>  
>  	message_entry_new(&m, logid, em);
>  
> @@ -374,12 +421,32 @@ int send_log_to_dbus(event_manager *em, const uint16_t logid)
>  				     "org.openbmc.Object.Delete",
>  				     recordlog_delete_vtable,
>  				     m);
> +
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to add delete object for: %s, %s\n",
> +			loglocation, strerror(-r));
> +		message_entry_close(m);
> +		return 0;
> +	}
>  	
> -	printf("Event Log added %s\n", loglocation);
> +	r = sd_bus_add_object_vtable(bus,
> +				     &m->associationslot,
> +				     loglocation,
> +				     "org.openbmc.Associations",
> +				     recordlog_association_vtable,
> +				     m);
> +
> +	if (r < 0) {
> +		fprintf(stderr, "Failed to add association object for: %s %s\n",
> +			loglocation, strerror(-r));
> +		message_entry_close(m);
> +		return 0;
> +	}
>  
>  	r = sd_bus_emit_object_added(bus, loglocation);
>  	if (r < 0) {
>  		fprintf(stderr, "Failed to emit signal %s\n", strerror(-r));
> +		message_entry_close(m);
>  		return 0;
>  	}
>  
> @@ -445,7 +512,7 @@ int build_bus(event_manager *em)
>  	
>  	/* You want to add an object manager to support deleting stuff  */
>  	/* without it, dbus can show interfaces that no longer exist */
> -	r = sd_bus_add_object_manager(bus, NULL, "/org/openbmc/records/events");
> +	r = sd_bus_add_object_manager(bus, NULL, event_path);
>  	if (r < 0) {
>  		fprintf(stderr, "Object Manager failure  %s\n", strerror(-r));
>  	}

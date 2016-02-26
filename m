Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9BC7E1A04B8
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 16:20:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=aup5kaJy; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id w128so4087558pfb.2
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 21:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=XpQxrgxK+1u+zLboXsPbyTVU8SDcWJH3WhoJjQj84h8=;
 b=aup5kaJy8u2frMuw5TIA8Dr4G22gdWGkbb8XuiA01c4kpH3NP0eODXpcN/HHSGoy0H
 dVkjmJwGUe9MXEv3l2sLVgbax0++gcE5kUlEZj8BLURo8JGr1qPm20zbhpJ8d5qDRXy0
 dVdnVzUSCSAZBqRPmUuw9wVSq0pXzxeyD4sNOjhJjwGPxk44ilSl8LwQwQvM5DxCs3iY
 53sX4nq0BguX/iuFR3xfU7WG+BsJfk63hS9aG12TGftdJME5ZcLSAQmEeYyclqoQs8vc
 qOffmHqkCg0uMlmEbS0fVfnzsTlm9TwFwCTKuVdR2cpuxkyqFFse17TfKMulX2ZQeE47
 SzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-type:content-transfer-encoding;
 bh=XpQxrgxK+1u+zLboXsPbyTVU8SDcWJH3WhoJjQj84h8=;
 b=kJKJ+HqRKwlXCeGCKNFaj/NMscv4MebmrCPpAUbOEOzNZxDwhyoRb23uuQj982In/i
 lE8WWy+lGTwx/AzdKPokTsR7qzNCsOZvBv5EnsPBLNXAzccSGoDF2vkIqzKtGeh0ne/P
 1eUrDIjtTSBbJsF7Q7f+yT3fDWFCeiUtyCmgVGuSB1pRR0LoTv3QguMAsYinbbJyyFzx
 muicoodatvuqslvDzsWJaKeND8e/Z+syLWExz2r30NxtkfvrljhUlE2z1gtKg+dj8YoR
 vxwwaq4UCTe0uRinvhBkXNHjTRtHdk/dgrK48RtdN8XnQ6q8CTsVQ6D8inyHrSDQVwLW
 GPvQ==
X-Gm-Message-State: AG10YORk7Oq50g85xkk6437mOVqmDIsSjJf7CnQ9E2M9lNwsv2WO8bbUj/9yCsgqNM9imQ==
X-Received: by 10.98.14.149 with SMTP id 21mr68384032pfo.79.1456464003707;
 Thu, 25 Feb 2016 21:20:03 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 19sm15816420pfb.64.2016.02.25.21.20.01
 (version=TLSv1/SSLv3 cipher=OTHER);
 Thu, 25 Feb 2016 21:20:03 -0800 (PST)
Date: Fri, 26 Feb 2016 16:19:56 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-event 2/2] Tabs, spaces and columns
Message-ID: <20160226161956.0581bc83@camb691>
In-Reply-To: <1455232232-15412-3-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455232232-15412-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455232232-15412-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
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
X-List-Received-Date: Fri, 26 Feb 2016 05:20:07 -0000

On Thu, 11 Feb 2016 17:10:32 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Chris Austen <austenc@us.ibm.com>
> 
> you wanted it you got it.  Indentation set to tabs, shrunk some
> lines to adhere to 80 columns.  All in one commit.

Heavily implied no function changes, I didn't see any.

Thanks Chris,

Probably already merged but for the record:
Reviewed-by: <cyrilbur@gmail.com>

> ---
>  event_messaged.C       |  81 +++++-----
>  event_messaged_sdbus.c | 226 +++++++++++++++-------------
>  event_messaged_sdbus.h |   4 +-
>  message.C              | 394 +++++++++++++++++++++++++------------------------
>  message.H              |  82 +++++-----
>  5 files changed, 401 insertions(+), 386 deletions(-)
> 
> diff --git a/event_messaged.C b/event_messaged.C
> index 174d7d7..9addd3f 100644
> --- a/event_messaged.C
> +++ b/event_messaged.C
> @@ -6,60 +6,65 @@ const char *path_to_messages = "/var/lib/obmc/events";
>  
>  using namespace std;
>  
> -void message_refresh_events(event_manager *em) {
> -    em->next_log_refresh();
> -    return;
> +void message_refresh_events(event_manager *em)
> +{
> +	em->next_log_refresh();
> +	return;
>  }
> -uint16_t message_next_event(event_manager *em) {
> -    return em->next_log();
> +uint16_t message_next_event(event_manager *em)
> +{
> +	return em->next_log();
>  }
>  
> -uint16_t message_create_new_log_event(event_manager *em, event_record_t *rec) {
> -    return em->create(rec);
> +uint16_t message_create_new_log_event(event_manager *em, event_record_t *rec)
> +{
> +	return em->create(rec);
>  }
> -int message_load_log(event_manager *em,uint16_t logid, event_record_t **rec) {
> -    return em->open(logid, rec);
> +int message_load_log(event_manager *em,uint16_t logid, event_record_t **rec)
> +{
> +	return em->open(logid, rec);
>  }
> -void message_free_log(event_manager *em, event_record_t *rec) {
> -    return em->close(rec);
> +void message_free_log(event_manager *em, event_record_t *rec)
> +{
> +	return em->close(rec);
>  }
> -int message_delete_log(event_manager *em, uint16_t logid) {
> -    return em->remove(logid);
> +int message_delete_log(event_manager *em, uint16_t logid)
> +{
> +	return em->remove(logid);
>  }
>  
> -int load_existing_events(event_manager *em) {
> +int load_existing_events(event_manager *em)
> +{
> +	uint16_t id;
>  
> -    uint16_t id;
> +	while ( (id = em->next_log()) != 0) {
> +		send_log_to_dbus(em, id);
> +	}
>  
> -    while ( (id = em->next_log()) != 0) {
> -        send_log_to_dbus(em, id);
> -    }
> -
> -    return 0;
> +	return 0;
>  }
>  
> -int main(int argc, char *argv[]) {
> -
> -    int rc = 0;
> -    event_manager em(path_to_messages);
> -
> +int main(int argc, char *argv[])
> +{
> +	int rc = 0;
> +	event_manager em(path_to_messages);
>  
> -    rc = build_bus(&em);
> -    if (rc < 0) {
> -        fprintf(stderr, "Event Messager failed to connect to dbus rc=%d", rc);
> -        goto finish;
> -    }
> +	rc = build_bus(&em);
> +	if (rc < 0) {
> +		fprintf(stderr, "Event Messager failed to connect to dbus rc=%d", rc);
> +		goto finish;
> +	}
>  
> -    rc = load_existing_events(&em);
> -    if (rc < 0) {
> -        fprintf(stderr, "Event Messager failed add previous logs to dbus rc=%d", rc);
> -        goto finish;
> -    }
> +	rc = load_existing_events(&em);
> +	if (rc < 0) {
> +		fprintf(stderr, "Event Messager failed add previous logs to dbus rc=%d", rc);
> +		goto finish;
> +	}
>  
> -    rc = start_event_monitor();
> +	rc = start_event_monitor();
>  
>  finish:
> -    cleanup_event_monitor();
> +	cleanup_event_monitor();
>  
> -    return rc;
> +	return rc;
>  }
> \ No newline at end of file
> diff --git a/event_messaged_sdbus.c b/event_messaged_sdbus.c
> index 7ba45a3..fc4c911 100644
> --- a/event_messaged_sdbus.c
> +++ b/event_messaged_sdbus.c
> @@ -21,8 +21,6 @@
>  /*                                                                           */
>  /*****************************************************************************/
>  
> -
> -
>  sd_bus      *bus   = NULL;
>  sd_bus_slot *slot  = NULL;
>  
> @@ -39,12 +37,14 @@ typedef struct messageEntry_t {
>  
>  static int remove_log_from_dbus(messageEntry_t *node);
>  
> -static void message_entry_close(messageEntry_t *m) {
> +static void message_entry_close(messageEntry_t *m)
> +{
>  	free(m);
>  	return;
>  }
>  
> -static void message_entry_new(messageEntry_t **m, uint16_t logid, event_manager *em) {
> +static void message_entry_new(messageEntry_t **m, uint16_t logid, event_manager *em)
> +{
>  	*m          = malloc(sizeof(messageEntry_t));
>  	(*m)->logid = logid;
>  	(*m)->em    = em;
> @@ -52,7 +52,8 @@ static void message_entry_new(messageEntry_t **m, uint16_t logid, event_manager
>  }
>  
>  // After calling this function the gCachedRec will be set
> -static event_record_t* message_record_open(event_manager *em, uint16_t logid) {
> +static event_record_t* message_record_open(event_manager *em, uint16_t logid)
> +{
>  
>  	int r = 0;
>  	event_record_t *rec;
> @@ -86,72 +87,76 @@ static event_record_t* message_record_open(event_manager *em, uint16_t logid) {
>  
>  
>  static int prop_message(sd_bus *bus,
> -                       const char *path,
> -                       const char *interface,
> -                       const char *property,
> -                       sd_bus_message *reply,
> -                       void *userdata,
> -                       sd_bus_error *error) {
> -
> +			const char *path,
> +			const char *interface,
> +			const char *property,
> +			sd_bus_message *reply,
> +			void *userdata,
> +			sd_bus_error *error)
> +{
>  	int r=0;
>  	messageEntry_t *m = (messageEntry_t*) userdata;
>  	char *p;
>  	struct tm *tm_info;
> -    char buffer[32];
> -    event_record_t *rec;
> +	char buffer[32];
> +	event_record_t *rec;
>  
>  	rec = message_record_open(m->em, m->logid);
> -
>  	if (!rec) {
>  		fprintf(stderr,"Warning missing evnet log for %d\n", m->logid);
> -		sd_bus_error_set(error,  SD_BUS_ERROR_FILE_NOT_FOUND,"Could not find log file");
> -        return -1;
> +		sd_bus_error_set(error,
> +			SD_BUS_ERROR_FILE_NOT_FOUND,
> +			"Could not find log file");
> +		return -1;
>  	}
>  
> -	if (!strncmp("message", property, 7))
> +	if (!strncmp("message", property, 7)) {
>  		p = rec->message;
> -	else if (!strncmp("severity", property, 8))
> +	} else if (!strncmp("severity", property, 8)) {
>  		p = rec->severity;
> -	else if (!strncmp("association", property, 11))
> +	} else if (!strncmp("association", property, 11)) {
>  		p = rec->association;
> -	else if (!strncmp("reported_by", property, 11))
> +	} else if (!strncmp("reported_by", property, 11)) {
>  		p = rec->reportedby;
> -	else if (!strncmp("time", property, 4)) {
> +	} else if (!strncmp("time", property, 4)) {
>  		tm_info = localtime(&rec->timestamp);
>  		strftime(buffer, 26, "%Y:%m:%d %H:%M:%S", tm_info);
> -		p    = buffer;
> -	}
> -	else
> +		p = buffer;
> +	} else {
>  		p = "";
> +	}
>  
>  	r = sd_bus_message_append(reply, "s", p);
>  	if (r < 0) {
> -	    fprintf(stderr,"Error building array for property %s\n", strerror(-r));
> +	    fprintf(stderr,"Error adding property to reply %s\n", strerror(-r));
>  	}
>  
> -
>  	return r;
>  }
>  
>  
>  static int prop_message_dd(sd_bus *bus,
> -                       const char *path,
> -                       const char *interface,
> -                       const char *property,
> -                       sd_bus_message *reply,
> -                       void *userdata,
> -                       sd_bus_error *error) {
> +		       const char *path,
> +		       const char *interface,
> +		       const char *property,
> +		       sd_bus_message *reply,
> +		       void *userdata,
> +		       sd_bus_error *error)
> +{
>  
> -    event_record_t *rec;
> -    messageEntry_t *m = (messageEntry_t*) userdata;
> +	event_record_t *rec;
> +	messageEntry_t *m = (messageEntry_t*) userdata;
>  
>  
>  	rec = message_record_open(m->em, m->logid);
>  
>  	if (!rec) {
> -		sd_bus_error_set(error,  SD_BUS_ERROR_FILE_NOT_FOUND,"Could not find log file");
> -        return -1;
> -    }
> +		sd_bus_error_set(error,
> +				 SD_BUS_ERROR_FILE_NOT_FOUND,
> +				 "Could not find log file");
> +
> +		return -1;
> +	}
>  	return sd_bus_message_append_array(reply, 'y', rec->p, rec->n);
>  }
>  
> @@ -166,9 +171,9 @@ static int prop_message_dd(sd_bus *bus,
>  //
>  /////////////////////////////////////////////////////////////
>  static int method_accept_host_message(sd_bus_message *m,
> -                                      void *userdata,
> -                                      sd_bus_error *ret_error) {
> -
> +				      void *userdata,
> +				      sd_bus_error *ret_error)
> +{
>  	char *message, *severity, *association, *s;
>  	size_t   n = 4;
>  	uint8_t *p;
> @@ -179,24 +184,24 @@ static int method_accept_host_message(sd_bus_message *m,
>  
>  	r = sd_bus_message_read(m, "sss", &message, &severity, &association);
>  	if (r < 0) {
> -		fprintf(stderr, "Failed to parse the String parameter: %s\n", strerror(-r));
> +		fprintf(stderr, "Error parsing strings: %s\n", 	strerror(-r));
>  		return r;
>  	}
>  
>  	r = sd_bus_message_read_array(m, 'y', (const void **)&p, &n);
>  	if (r < 0) {
> -		fprintf(stderr, "Failed to parse the array of bytes parameter: %s\n", strerror(-r));
> +		fprintf(stderr, "Error parsing debug data: %s\n", strerror(-r));
>  		return r;
>  	}
>  
> -    rec.message     = (char*) message;
> -    rec.severity    = (char*) severity;
> -    rec.association = (char*) association;
> -    rec.reportedby  = (char*) "Host";
> -    rec.p           = (uint8_t*) p;
> -    rec.n           = n;
> +	rec.message     = (char*) message;
> +	rec.severity    = (char*) severity;
> +	rec.association = (char*) association;
> +	rec.reportedby  = (char*) "Host";
> +	rec.p           = (uint8_t*) p;
> +	rec.n           = n;
>  
> -    asprintf(&s, "%s %s (%s)", rec.severity, rec.message, rec.association);
> +	asprintf(&s, "%s %s (%s)", rec.severity, rec.message, rec.association);
>  	syslog(LOG_NOTICE, s);
>  	free(s);
>  
> @@ -210,9 +215,9 @@ static int method_accept_host_message(sd_bus_message *m,
>  
>  
>  static int method_accept_test_message(sd_bus_message *m,
> -                                      void *userdata,
> -                                      sd_bus_error *ret_error) {
> -
> +				      void *userdata,
> +				      sd_bus_error *ret_error)
> +{
>  	//  Random debug data including, ascii, null, >signed int, max
>  	uint8_t p[] = {0x30, 0x00, 0x13, 0x7F, 0x88, 0xFF};
>  	char *s;
> @@ -223,7 +228,7 @@ static int method_accept_test_message(sd_bus_message *m,
>  	rec.message     = (char*) "A Test event log just happened";
>  	rec.severity    = (char*) "Info";
>  	rec.association = (char*) "/org/openbmc/inventory/system/chassis/motherboard/dimm3 " \
> -	                          "/org/openbmc/inventory/system/chassis/motherboard/dimm2";
> +				  "/org/openbmc/inventory/system/chassis/motherboard/dimm2";
>  	rec.reportedby  = (char*) "Test";
>  	rec.p           = (uint8_t*) p;
>  	rec.n           = 6;
> @@ -239,11 +244,13 @@ static int method_accept_test_message(sd_bus_message *m,
>  	return sd_bus_reply_method_return(m, "q", logid);
>  }
>  
> -static int finish_delete_log(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
> +static int finish_delete_log(sd_bus_message *m, void *userdata, sd_bus_error *ret_error)
> +{
>  	return 0;
>  }
>  
> -static int method_clearall(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
> +static int method_clearall(sd_bus_message *m, void *userdata, sd_bus_error *ret_error)
> +{
>  	event_manager *em = (event_manager *) userdata;
>  	uint16_t logid;
>  	char buffer[32];
> @@ -253,19 +260,22 @@ static int method_clearall(sd_bus_message *m, void *userdata, sd_bus_error *ret_
>  	message_refresh_events(em);
>  
>  	while (logid = message_next_event(em)) {
> -		snprintf(buffer, sizeof(buffer), "/org/openbmc/records/events/%d", logid);
> +		snprintf(buffer, sizeof(buffer),
> +			"/org/openbmc/records/events/%d", logid);
>  
>  		r = sd_bus_call_method_async(bus,
> -									 NULL,
> -									 "org.openbmc.records.events",
> -									 buffer,
> -									 "org.openbmc.Object.Delete",
> -									 "delete",
> -									 finish_delete_log,
> -									 NULL,
> -									 NULL);
> +					     NULL,
> +					     "org.openbmc.records.events",
> +					     buffer,
> +					     "org.openbmc.Object.Delete",
> +					     "delete",
> +					     finish_delete_log,
> +					     NULL,
> +					     NULL);
>  		if (r < 0) {
> -			fprintf(stderr, "sd_bus_call_method_async Failed : %s\n", strerror(-r));
> +			fprintf(stderr,
> +				"sd_bus_call_method_async Failed : %s\n",
> +				strerror(-r));
>  			return -1;
>  		}
>  	}
> @@ -274,8 +284,8 @@ static int method_clearall(sd_bus_message *m, void *userdata, sd_bus_error *ret_
>  }
>  
>  
> -static int method_deletelog(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
> -
> +static int method_deletelog(sd_bus_message *m, void *userdata, sd_bus_error *ret_error)
> +{
>  	messageEntry_t *p = (messageEntry_t *) userdata;
>  
>  	message_delete_log(p->em, p->logid);
> @@ -295,12 +305,12 @@ static const sd_bus_vtable recordlog_vtable[] = {
>  
>  static const sd_bus_vtable log_vtable[] = {
>  	SD_BUS_VTABLE_START(0),   
> -	SD_BUS_PROPERTY("association",      "s", prop_message, 0, SD_BUS_VTABLE_PROPERTY_CONST),
> -	SD_BUS_PROPERTY("message",          "s", prop_message, 0, SD_BUS_VTABLE_PROPERTY_CONST),
> -	SD_BUS_PROPERTY("severity",         "s", prop_message, 0, SD_BUS_VTABLE_PROPERTY_CONST),
> -	SD_BUS_PROPERTY("reported_by",      "s", prop_message, 0, SD_BUS_VTABLE_PROPERTY_CONST),
> -	SD_BUS_PROPERTY("time",             "s", prop_message, 0, SD_BUS_VTABLE_PROPERTY_CONST),
> -	SD_BUS_PROPERTY("debug_data", "ay", prop_message_dd ,0, SD_BUS_VTABLE_PROPERTY_CONST),
> +	SD_BUS_PROPERTY("association", "s",  prop_message,    0, SD_BUS_VTABLE_PROPERTY_CONST),
> +	SD_BUS_PROPERTY("message",     "s",  prop_message,    0, SD_BUS_VTABLE_PROPERTY_CONST),
> +	SD_BUS_PROPERTY("severity",    "s",  prop_message,    0, SD_BUS_VTABLE_PROPERTY_CONST),
> +	SD_BUS_PROPERTY("reported_by", "s",  prop_message,    0, SD_BUS_VTABLE_PROPERTY_CONST),
> +	SD_BUS_PROPERTY("time",        "s",  prop_message,    0, SD_BUS_VTABLE_PROPERTY_CONST),
> +	SD_BUS_PROPERTY("debug_data",  "ay", prop_message_dd ,0, SD_BUS_VTABLE_PROPERTY_CONST),
>  	SD_BUS_VTABLE_END
>  };
>  
> @@ -311,12 +321,13 @@ static const sd_bus_vtable recordlog_delete_vtable[] = {
>  	SD_BUS_VTABLE_END
>  };
>  
> -static int remove_log_from_dbus(messageEntry_t *p) {
> -
> +static int remove_log_from_dbus(messageEntry_t *p)
> +{
>  	int r;
>  	char buffer[32];
>  
> -	snprintf(buffer, sizeof(buffer), "/org/openbmc/records/events/%d", p->logid);
> +	snprintf(buffer, sizeof(buffer),
> +		"/org/openbmc/records/events/%d", p->logid);
>  
>  	printf("Attempting to delete %s\n", buffer);
>  
> @@ -333,34 +344,36 @@ static int remove_log_from_dbus(messageEntry_t *p) {
>  	return 0;
>  }
>  
> -int send_log_to_dbus(event_manager *em, const uint16_t logid) {
> -
> +int send_log_to_dbus(event_manager *em, const uint16_t logid)
> +{
>  	char loglocation[64];
>  	int r;
>  	messageEntry_t *m;
>  
> -	snprintf(loglocation, sizeof(loglocation), "/org/openbmc/records/events/%d", logid);
> +	snprintf(loglocation, sizeof(loglocation),
> +		"/org/openbmc/records/events/%d", logid);
>  
>  	message_entry_new(&m, logid, em);
>  
>  	r = sd_bus_add_object_vtable(bus,
> -	                             &m->messageslot,
> -	                             loglocation,
> -	                             "org.openbmc.record",
> -	                             log_vtable,
> -	                             m);
> +				     &m->messageslot,
> +				     loglocation,
> +				     "org.openbmc.record",
> +				     log_vtable,
> +				     m);
>  	if (r < 0) {
> -		fprintf(stderr, "Failed to acquire service name: %s %s\n", loglocation, strerror(-r));
> +		fprintf(stderr, "Failed to acquire service name: %s %s\n",
> +			loglocation, strerror(-r));
>  		message_entry_close(m);
>  		return 0;
>  	}
>  
>  	r = sd_bus_add_object_vtable(bus,
> -	                             &m->deleteslot,
> -	                             loglocation,
> -	                             "org.openbmc.Object.Delete",
> -	                             recordlog_delete_vtable,
> -	                             m);
> +				     &m->deleteslot,
> +				     loglocation,
> +				     "org.openbmc.Object.Delete",
> +				     recordlog_delete_vtable,
> +				     m);
>  	
>  	printf("Event Log added %s\n", loglocation);
>  
> @@ -374,15 +387,15 @@ int send_log_to_dbus(event_manager *em, const uint16_t logid) {
>  }
>  
>  
> -int start_event_monitor(void) {
> -
> +int start_event_monitor(void)
> +{
>  	int r;
>  
>  	for (;;) {
>  
>  		r = sd_bus_process(bus, NULL);
>  		if (r < 0) {
> -			fprintf(stderr, "Failed to process bus: %s\n", strerror(-r));
> +			fprintf(stderr, "Error bus process: %s\n", strerror(-r));
>  			break;
>  		}
>  
> @@ -391,7 +404,7 @@ int start_event_monitor(void) {
>  
>  		r = sd_bus_wait(bus, (uint64_t) -1);
>  		if (r < 0) {
> -			fprintf(stderr, "Failed to wait on bus: %s\n", strerror(-r));
> +			fprintf(stderr, "Error in sd_bus_wait: %s\n", strerror(-r));
>  			break;
>  		}
>  	}
> @@ -401,33 +414,33 @@ int start_event_monitor(void) {
>  
>  
>  /* Only thing we are doing in this function is to get a connection on the dbus */
> -int build_bus(event_manager *em) {
> +int build_bus(event_manager *em)
> +{
>  
>  	int r = 0;
>  
>  	/* Connect to the system bus */
>  	r = sd_bus_open_system(&bus);
>  	if (r < 0) {
> -		fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
> +		fprintf(stderr, "Error connecting to system bus: %s\n", strerror(-r));
>  		goto finish;
>  	}
>  
>  	/* Install the object */
>  	r = sd_bus_add_object_vtable(bus,
> -	                             &slot,
> -	                             "/org/openbmc/records/events",  /* object path */
> -	                             "org.openbmc.recordlog",   /* interface name */
> -	                             recordlog_vtable,
> -	                             em);
> +				     &slot,
> +				     "/org/openbmc/records/events",
> +				     "org.openbmc.recordlog",
> +				     recordlog_vtable,
> +				     em);
>  	if (r < 0) {
> -		fprintf(stderr, "Failed to issue method call: %s\n", strerror(-r));
> +		fprintf(stderr, "Error adding vtable: %s\n", strerror(-r));
>  		goto finish;
>  	}
>  
> -	/* Take a well-known service name so that clients can find us */
>  	r = sd_bus_request_name(bus, "org.openbmc.records.events", 0);
>  	if (r < 0) {
> -		fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-r));
> +		fprintf(stderr, "Error requesting name: %s\n", strerror(-r));
>  	}	
>  	
>  	/* You want to add an object manager to support deleting stuff  */
> @@ -442,7 +455,8 @@ int build_bus(event_manager *em) {
>  	return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
>  }
>  
> -void cleanup_event_monitor(void) {
> +void cleanup_event_monitor(void)
> +{
>  	sd_bus_slot_unref(slot);
>  	sd_bus_unref(bus);
>  }
> \ No newline at end of file
> diff --git a/event_messaged_sdbus.h b/event_messaged_sdbus.h
> index 69a00a6..4565af8 100644
> --- a/event_messaged_sdbus.h
> +++ b/event_messaged_sdbus.h
> @@ -1,7 +1,7 @@
>  #include <stddef.h>
>  
>  #ifdef __cplusplus
> -extern "C"  {
> +extern "C" {
>  #endif
>  	int start_event_monitor(void);
>  	int build_bus(event_manager *em);
> @@ -10,5 +10,3 @@ extern "C"  {
>  #ifdef __cplusplus
>  }
>  #endif
> -
> -
> diff --git a/message.C b/message.C
> index a3fe8b8..74dd086 100644
> --- a/message.C
> +++ b/message.C
> @@ -17,275 +17,279 @@ const uint32_t g_eyecatcher = 0x4F424D43; // OBMC
>  const uint16_t g_version    = 1;
>  
>  struct logheader_t {
> -    uint32_t eyecatcher;
> -    uint16_t version;
> -    uint16_t logid;
> -    time_t   timestamp;
> -    uint16_t detailsoffset;
> -    uint16_t messagelen;
> -    uint16_t severitylen;
> -    uint16_t associationlen;
> -    uint16_t reportedbylen;
> -    uint16_t debugdatalen;
> +	uint32_t eyecatcher;
> +	uint16_t version;
> +	uint16_t logid;
> +	time_t   timestamp;
> +	uint16_t detailsoffset;
> +	uint16_t messagelen;
> +	uint16_t severitylen;
> +	uint16_t associationlen;
> +	uint16_t reportedbylen;
> +	uint16_t debugdatalen;
>  };
>  
>  
> +event_manager::event_manager(string path)
> +{
> +	uint16_t x;
> +	eventpath = path;
> +	latestid = 0;
> +	dirp = NULL;
> +	logcount = 0;
>  
> -event_manager::event_manager(string path) {
> -    uint16_t x;
> +	// examine the files being managed and advance latestid to that value
> +	while ( (x = next_log()) ) {
> +		logcount++;
> +		if ( x > latestid )
> +			latestid = x;
> +	}
>  
> -    eventpath = path;
> -
> -    latestid = 0;
> -    dirp = NULL;
> -    logcount = 0;
> -
> -    // examine the files being managed and advance latestid to that value
> -    while ( (x = next_log())  ) {
> -        logcount++;
> -        if ( x > latestid )
> -            latestid = x;
> -    }
> -
> -    return;
> +	return;
>  }
>  
> -event_manager::~event_manager() {
> +event_manager::~event_manager()
> +{
> +	if (dirp)
> +		closedir(dirp);
>  
> -    if (dirp) {
> -        closedir(dirp);
> -    }
> -
> -    return;
> +	return;
>  }
>  
> -bool event_manager::is_file_a_log(string str) {
> +bool event_manager::is_file_a_log(string str)
> +{
> +	std::ostringstream buffer;
> +	ifstream f;
> +	logheader_t hdr;
>  
> -    std::ostringstream buffer;
> -    ifstream f;
> -    logheader_t hdr;
> +	if (!str.compare("."))
> +		return 0;
>  
> -    if (!str.compare("."))
> -        return 0;
> -    if (!str.compare(".."))
> -        return 0;
> +	if (!str.compare(".."))
> +		return 0;
>  
> -    buffer << eventpath << "/" << str;
> +	buffer << eventpath << "/" << str;
>  
> -    f.open( buffer.str(), ios::binary);
> +	f.open( buffer.str(), ios::binary);
>  
> -    if (!f.good()) {
> -        return 0;
> -    }
> +	if (!f.good()) {
> +		return 0;
> +	}
>  
> -    f.read((char*)&hdr, sizeof(hdr));
> +	f.read((char*)&hdr, sizeof(hdr));
>  
> -    if (hdr.eyecatcher != g_eyecatcher)
> -        return 0;
> +	if (hdr.eyecatcher != g_eyecatcher)
> +		return 0;
>  
> -    return 1;
> +	return 1;
>  }
>  
> -uint16_t event_manager::log_count(void) {
> -    return logcount;
> +uint16_t event_manager::log_count(void)
> +{
> +	return logcount;
>  }
> -uint16_t event_manager::latest_log_id(void) {
> -    return latestid;
> +uint16_t event_manager::latest_log_id(void)
> +{
> +	return latestid;
>  }
> -uint16_t event_manager::new_log_id(void) {
> -    return ++latestid;
> +uint16_t event_manager::new_log_id(void)
> +{
> +	return ++latestid;
>  }
> -void event_manager::next_log_refresh(void) {
> -    if (dirp) {
> -        closedir(dirp);
> -        dirp = NULL;
> -    }
> -    return;
> +void event_manager::next_log_refresh(void)
> +{
> +	if (dirp) {
> +		closedir(dirp);
> +		dirp = NULL;
> +	}
> +
> +	return;
>  }
>  
> -uint16_t event_manager::next_log(void) {
> -
> -    std::ostringstream buffer;
> -    struct dirent *ent;
> -    uint16_t id;
> -
> +uint16_t event_manager::next_log(void)
> +{
> +	std::ostringstream buffer;
> +	struct dirent *ent;
> +	uint16_t id;
>  
> -    if (dirp == NULL)
> -        dirp = opendir(eventpath.c_str());
> +	if (dirp == NULL)
> +		dirp = opendir(eventpath.c_str());
>  
> -    if (dirp) {
> -        do {
> -            ent = readdir(dirp);
> +	if (dirp) {
> +		do {
> +			ent = readdir(dirp);
>  
> -            if (ent == NULL)
> -                break;
> +			if (ent == NULL)
> +				break;
>  
> -            string str(ent->d_name);
> +			string str(ent->d_name);
>  
> -            if (is_file_a_log(str)) {
> -                id = (uint16_t) atoi(str.c_str());
> -                break;
> -            }
> +			if (is_file_a_log(str)) {
> +				id = (uint16_t) atoi(str.c_str());
> +				break;
> +			}
>  
> -        } while( 1 );
> -    } else {
> -        cerr << "Error opening directory " << eventpath << endl;
> -        ent    = NULL;
> -        id = 0;
> -    }
> +		} while( 1 );
> +	} else {
> +		cerr << "Error opening directory " << eventpath << endl;
> +		ent = NULL;
> +		id = 0;
> +	}
>  
> -    if (ent == NULL) {
> -        closedir(dirp);
> -        dirp = NULL;
> -    }
> +	if (ent == NULL) {
> +		closedir(dirp);
> +		dirp = NULL;
> +	}
>  
> -    return  ((ent == NULL) ? 0 : id);
> +	return  ((ent == NULL) ? 0 : id);
>  }
>  
>  
> -uint16_t event_manager::create(event_record_t *rec) {
> +uint16_t event_manager::create(event_record_t *rec)
> +{
> +	rec->logid = new_log_id();
> +	rec->timestamp = time(NULL);
>  
> -    rec->logid = new_log_id();
> -    rec->timestamp = time(NULL);
> -    return create_log_event(rec);
> +	return create_log_event(rec);
>  }
>  
> -inline uint16_t getlen(const char *s) {
> -    return (uint16_t) (1 + strlen(s));
> +inline uint16_t getlen(const char *s)
> +{
> +	return (uint16_t) (1 + strlen(s));
>  }
>  
>  
> +size_t event_manager::get_managed_size(void)
> +{
> +	DIR *dirp;
> +	std::ostringstream buffer;
> +	struct dirent *ent;
> +	ifstream f;
>  
> -size_t event_manager::get_managed_size(void) {
> -    DIR *dirp;
> -    std::ostringstream buffer;
> -    struct dirent *ent;
> -    ifstream f;
> +	size_t db_size = 0;
>  
> -    size_t db_size = 0;
> +	dirp = opendir(eventpath.c_str());
>  
> -    dirp = opendir(eventpath.c_str());
> +	if (dirp) {
> +		while ( (ent = readdir(dirp)) != NULL ) {
>  
> -    if (dirp) {
> -        while ( (ent = readdir(dirp)) != NULL ) {
> +			string str(ent->d_name);
>  
> -            string str(ent->d_name);
> +			if (is_file_a_log(str)) {
>  
> -            if (is_file_a_log(str)) {
> +				buffer.str("");
> +				buffer << eventpath << "/" << str.c_str();
>  
> -                buffer.str("");
> -                buffer << eventpath << "/" << str.c_str();
> +				f.open(buffer.str() , ios::in|ios::binary|ios::ate);
> +				db_size += f.tellg();
> +				f.close();
> +			}
> +		}
> +	}
>  
> -                f.open(buffer.str() , ios::in|ios::binary|ios::ate);
> -                db_size += f.tellg();
> -                f.close();
> -            }
> -        }
> -    }
> +	closedir(dirp);
>  
> -    closedir(dirp);
> -
> -    return  (db_size);
> +	return (db_size);
>  }
>  
> -uint16_t event_manager::create_log_event(event_record_t *rec) {
> -
> -    std::ostringstream buffer;
> -    ofstream myfile;
> -    logheader_t hdr = {0};
> -
> -    buffer << eventpath << "/" << int(rec->logid) ;
> -
> -    hdr.eyecatcher     = g_eyecatcher;
> -    hdr.version        = g_version;
> -    hdr.logid          = rec->logid;
> -    hdr.timestamp      = rec->timestamp;
> -    hdr.detailsoffset  = offsetof(logheader_t, messagelen);
> -    hdr.messagelen     = getlen(rec->message);
> -    hdr.severitylen    = getlen(rec->severity);
> -    hdr.associationlen = getlen(rec->association);
> -    hdr.reportedbylen  = getlen(rec->reportedby);
> -    hdr.debugdatalen   = rec->n;
> -
> -    myfile.open(buffer.str() , ios::out|ios::binary);
> -    myfile.write((char*) &hdr, sizeof(hdr));
> -    myfile.write((char*) rec->message, hdr.messagelen);
> -    myfile.write((char*) rec->severity, hdr.severitylen);
> -    myfile.write((char*) rec->association, hdr.associationlen);
> -    myfile.write((char*) rec->reportedby, hdr.reportedbylen);
> -    myfile.write((char*) rec->p, hdr.debugdatalen);
> -    myfile.close();
> -
> -    logcount++;
> -
> -    return rec->logid;
> +uint16_t event_manager::create_log_event(event_record_t *rec)
> +{
> +	std::ostringstream buffer;
> +	ofstream myfile;
> +	logheader_t hdr = {0};
> +
> +	buffer << eventpath << "/" << int(rec->logid) ;
> +
> +	hdr.eyecatcher     = g_eyecatcher;
> +	hdr.version        = g_version;
> +	hdr.logid          = rec->logid;
> +	hdr.timestamp      = rec->timestamp;
> +	hdr.detailsoffset  = offsetof(logheader_t, messagelen);
> +	hdr.messagelen     = getlen(rec->message);
> +	hdr.severitylen    = getlen(rec->severity);
> +	hdr.associationlen = getlen(rec->association);
> +	hdr.reportedbylen  = getlen(rec->reportedby);
> +	hdr.debugdatalen   = rec->n;
> +
> +	myfile.open(buffer.str() , ios::out|ios::binary);
> +	myfile.write((char*) &hdr, sizeof(hdr));
> +	myfile.write((char*) rec->message, hdr.messagelen);
> +	myfile.write((char*) rec->severity, hdr.severitylen);
> +	myfile.write((char*) rec->association, hdr.associationlen);
> +	myfile.write((char*) rec->reportedby, hdr.reportedbylen);
> +	myfile.write((char*) rec->p, hdr.debugdatalen);
> +	myfile.close();
> +
> +	logcount++;
> +
> +	return rec->logid;
>  }
>  
> -int event_manager::open(uint16_t logid, event_record_t **rec) {
> -
> -    std::ostringstream buffer;
> -    ifstream f;
> -    logheader_t hdr;
> +int event_manager::open(uint16_t logid, event_record_t **rec)
> +{
> +	std::ostringstream buffer;
> +	ifstream f;
> +	logheader_t hdr;
>  
> -    buffer << eventpath << "/" << int(logid);
> +	buffer << eventpath << "/" << int(logid);
>  
> -    f.open( buffer.str(), ios::binary );
> +	f.open( buffer.str(), ios::binary );
>  
> -    if (!f.good()) {
> -        return 0;
> -    }
> +	if (!f.good()) {
> +		return 0;
> +	}
>  
> -    *rec = new event_record_t;
> +	*rec = new event_record_t;
>  
> -    f.read((char*)&hdr, sizeof(hdr));
> +	f.read((char*)&hdr, sizeof(hdr));
>  
> -    (*rec)->logid     = hdr.logid;
> -    (*rec)->timestamp = hdr.timestamp;
> +	(*rec)->logid     = hdr.logid;
> +	(*rec)->timestamp = hdr.timestamp;
>  
>  
> -    (*rec)->message = new char[hdr.messagelen];
> -    f.read((*rec)->message, hdr.messagelen);
> +	(*rec)->message = new char[hdr.messagelen];
> +	f.read((*rec)->message, hdr.messagelen);
>  
> -    (*rec)->severity = new char[hdr.severitylen];
> -    f.read((*rec)->severity, hdr.severitylen);
> +	(*rec)->severity = new char[hdr.severitylen];
> +	f.read((*rec)->severity, hdr.severitylen);
>  
> -    (*rec)->association = new char[hdr.associationlen];
> -    f.read((*rec)->association, hdr.associationlen);
> +	(*rec)->association = new char[hdr.associationlen];
> +	f.read((*rec)->association, hdr.associationlen);
>  
> -    (*rec)->reportedby = new char[hdr.reportedbylen];
> -    f.read((*rec)->reportedby, hdr.reportedbylen);
> +	(*rec)->reportedby = new char[hdr.reportedbylen];
> +	f.read((*rec)->reportedby, hdr.reportedbylen);
>  
> -    (*rec)->p = new uint8_t[hdr.debugdatalen];
> -    f.read((char*)(*rec)->p, hdr.debugdatalen);
> -    (*rec)->n = hdr.debugdatalen;
> +	(*rec)->p = new uint8_t[hdr.debugdatalen];
> +	f.read((char*)(*rec)->p, hdr.debugdatalen);
> +	(*rec)->n = hdr.debugdatalen;
>  
>  
> -    f.close();
> -    return logid;
> +	f.close();
> +	return logid;
>  }
>  
> -void event_manager::close(event_record_t *rec) {
> -
> -    delete[] rec->message;
> -    delete[] rec->severity;
> -    delete[] rec->association;
> -    delete[] rec->reportedby;
> -    delete[] rec->p;
> -    delete rec;
> -
> -    logcount--;
> -    return ;
> +void event_manager::close(event_record_t *rec)
> +{
> +	delete[] rec->message;
> +	delete[] rec->severity;
> +	delete[] rec->association;
> +	delete[] rec->reportedby;
> +	delete[] rec->p;
> +	delete rec;
> +
> +	logcount--;
> +	return ;
>  }
>  
> -int event_manager::remove(uint16_t logid) {
> -
> -    std::stringstream buffer;
> -    string s;
> +int event_manager::remove(uint16_t logid)
> +{
> +	std::stringstream buffer;
> +	string s;
>  
> -    buffer << eventpath << "/" << int(logid);
> +	buffer << eventpath << "/" << int(logid);
>  
> -    s = buffer.str();
> -    std::remove(s.c_str());
> +	s = buffer.str();
> +	std::remove(s.c_str());
>  
> -    return 0;
> +	return 0;
>  }
> diff --git a/message.H b/message.H
> index 8025ecd..5cc3484 100644
> --- a/message.H
> +++ b/message.H
> @@ -3,70 +3,66 @@
>  #include <time.h>
>  
>  #ifdef __cplusplus
> -    #include <cstdint>
> -    #include <string>
> -
> -    using namespace std;
> +	#include <cstdint>
> +	#include <string>
>  
> +	using namespace std;
>  #else
> -    #include <stdint.h>
> +	#include <stdint.h>
>  #endif
>  
> -
> -
>  #ifdef __cplusplus
> -    struct event_record_t {
> -#else     
> -    typedef struct _event_record_t {
> +	struct event_record_t {
> +#else
> +	typedef struct _event_record_t {
>  #endif
> -        char *message;
> -        char *severity;
> -        char *association;
> -        char *reportedby;
> -        uint8_t *p;
> -        size_t n;
> -
> -        // These get filled in for you
> -        time_t  timestamp;        
> -        int16_t logid;
> +		char *message;
> +		char *severity;
> +		char *association;
> +		char *reportedby;
> +		uint8_t *p;
> +		size_t n;
> +
> +		// These get filled in for you
> +		time_t  timestamp;        
> +		int16_t logid;
>  #ifdef __cplusplus
> -    };
> +	};
>  
> -#else     
> -    } event_record_t;
> +#else
> +	} event_record_t;
>  #endif
>  
>  
> -
>  #ifdef __cplusplus
>  
>  class event_manager {
> -    uint16_t latestid;
> -    string   eventpath;
> -    DIR      *dirp;
> -    uint16_t logcount;
> +	uint16_t latestid;
> +	string   eventpath;
> +	DIR      *dirp;
> +	uint16_t logcount;
>  
>  public:
> -    event_manager(string path);
> -    ~event_manager();
> +	event_manager(string path);
> +	~event_manager();
>  
> -    uint16_t next_log(void);
> -    void     next_log_refresh(void);
> +	uint16_t next_log(void);
> +	void     next_log_refresh(void);
>  
> -    uint16_t latest_log_id(void);
> -    uint16_t log_count(void);
> -    size_t   get_managed_size(void);
> +	uint16_t latest_log_id(void);
> +	uint16_t log_count(void);
> +	size_t   get_managed_size(void);
>  
> -    int      open(uint16_t logid, event_record_t **rec); // must call close
> -    void     close(event_record_t *rec);
> +	int      open(uint16_t logid, event_record_t **rec); // must call close
> +	void     close(event_record_t *rec);
>  
> -    uint16_t create(event_record_t *rec);
> -    int      remove(uint16_t logid);
> +	uint16_t create(event_record_t *rec);
> +	int      remove(uint16_t logid);
>  
>  private:
> -    bool is_file_a_log(string str);
> -    uint16_t create_log_event(event_record_t *rec);
> -    uint16_t new_log_id(void);
> +	bool is_file_a_log(string str);
> +	uint16_t create_log_event(event_record_t *rec);
> +	uint16_t new_log_id(void);
>  };
>  #else
>  typedef struct event_manager event_manager;
> @@ -75,8 +71,6 @@ typedef struct event_manager event_manager;
>  #ifdef __cplusplus
>  extern "C"  {
>  #endif
> -
> -
>  uint16_t message_create_new_log_event(event_manager *em, event_record_t *rec);
>  int      message_load_log(event_manager *em, uint16_t logid, event_record_t **rec);
>  void     message_free_log(event_manager *em, event_record_t *rec);

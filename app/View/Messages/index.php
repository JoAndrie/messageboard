<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css">
<?php echo $this->Html->css('message_list'); ?>

<div class="container mt-5">
    <div class="alert alert-success alert-dismissible" role="alert" id="successAlertDiv">
        <div class="d-flex justify-content-between">
            <span id="successAlertText"></span>
            <button type="button" class="close btn btn-success" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </div>

    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="message-list-header mb-4">
                <h1 class="text-primary">Message List</h1>
                <button class="btn btn-primary" data-toggle="modal" data-target="#messageModal">+ New Message</button>
            </div>
            
            <div class="messages-container" id="message-thread-container">
                <!-- This is where message threads will be dynamically added -->
            </div>
            
            <div class="message-list-footer mt-4 text-center">
                <div id="show-more-div">show more</div>
                <div id="no-more-div">no more message threads to add</div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Send New Message</h5>
            </div>
            <div class="modal-body">
                <div>
                    <label for="userSearch">Send to:</label>
                    <select class="js-example-basic-single js-states form-control userSearchClass" id="userSearch" style="width: 100%; height: 42px;"></select>
                </div>
                <div class="form-group mt-4">
                    <label for="textField">Message:</label>
                    <textarea class="form-control" id="messageText" style="width: 100%; height: 100px;"></textarea>
                </div>
                <div>
                    <span id="messageErrorText" style="color: red; font-style: italic;"></span>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="closeMessageBtn">Close</button>
                <button type="button" class="btn btn-primary" id="sendMessageBtn"><i class="fas fa-paper-plane"></i> Send</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

<script>
   $(document).ready(function () {
    $("#successAlertDiv").hide();
    $("#no-more-div").hide();

    generateInitial();

    $(document).on('click', '.view-button', function (event) {
        const messageThreadId = event.target.getAttribute('data-message-thread-id');
        const redirectUrl = '/messageboard/messages/view?messageThreadId=' + messageThreadId;
        $.get(redirectUrl, function (response) {
            window.location.href = redirectUrl;
        }).fail(function () {
            console.error("Ajax Error");
        });
    });

    // select2 initialization and data collect
    $('.userSearchClass').select2({
        ajax: {
            url: '/messageboard/users/get_users',
            dataType: 'json',
            processResults: function (data) {
                return {
                    results: data.users
                };
            }
        },
        dropdownParent: $("#messageModal"),
        templateResult: formatOption,
        templateSelection: formatOption,
        placeholder: "Send to ...",
        minimumInputLength: 2
    });

    // formatting select2 options
    function formatOption(option) {
        if (!option.id) {
            return option.text;
        }
        var imageSize = '24px';
        var optionHeight = '40px';

        var imgSrc = "<?php echo $this->webroot; ?>" + ((option.img_url == '') ? '/img/default.png' : option.img_url);

        var $option = $(
            '<span style="display: flex; align-items: center; height: ' + optionHeight + ';">' +
            '<img class="option-image" src="' + imgSrc + '" style="width: ' + imageSize + '; height: ' + imageSize + ';" />' +
            '<span style="margin-left: 10px; line-height: ' + optionHeight + ';">' + option.text + '</span>' +
            '</span>'
        );
        return $option;
    }

    // reset new message on close
    $('#messageModal').on('hidden.bs.modal', function () {
        $('#userSearch').val(null).trigger('change');
        $("#messageText").val("");
        $("#messageErrorText").text("");
    });

    $("#sendMessageBtn").click(function () {
        var selectedData = $("#userSearch").select2("data");
        var message_content = $("#messageText").val();

        if (selectedData.length == 0 || !message_content) {
            if (selectedData.length == 0 && !message_content) {
                $("#messageErrorText").text("Send To and Message fields should not be empty.");
            } else if (selectedData.length == 0) {
                $("#messageErrorText").text("Send To field should not be empty.");
            } else if (!message_content) {
                $("#messageErrorText").text("Message field should not be empty.");
            }
        } else {
            console.log("sending message");

            var sender_id = <?php echo $_SESSION['userData']['user_id']; ?>;
            var receiver_id = selectedData[0].id;
            $("#messageErrorText").text("");
            $.ajax({
                type: 'POST',
                dataType: 'json',
                data: {
                    sender_id: sender_id,
                    receiver_id: receiver_id,
                    message_content: message_content
                },
                url: '/messageboard/messages/send_message',
                success: function (data) {
                    console.log("Message Thread Created Successfully!");
                    $('#closeMessageBtn').click();
                    $("#successAlertText").text("Successfully sent the message.");
                    $("#successAlertDiv").show();
                    $('html, body').animate({
                        scrollTop: 0
                    }, 'fast');
                    $("#message-thread-container").empty(); // Clear container after sending message
                    generateInitial(); // Re-generate initial threads
                },
                error: function () {
                    console.log("Send message error");
                }
            });
        }
    });

    // Function to fetch and generate initial message threads
    function generateInitial() {
        $.ajax({
            type: "POST",
            dataType: 'json',
            url: '/messageboard/messages/message_thread',
            data: {
                threadCount: 0
            },
            success: function (data) {
                console.log("Initial data:", data);
                displayMessageThreads(data);
            },
            error: function (xhr, status, error) {
                console.error("Error fetching initial message threads:", status, error);
            }
        });
    }

    // Function to fetch and display more message threads
    function showMoreThreads() {
        var threadCount = $("#message-thread-container").find(".thread-card").length;
        console.log("Current thread count:", threadCount);

        $.ajax({
            type: 'POST',
            dataType: 'json',
            url: '/messageboard/messages/message_thread',
            data: {
                threadCount: threadCount
            },
            success: function (data) {
                if (data.length > 0) {
                    displayMessageThreads(data);
                } else {
                    $("#show-more-div").hide();
                    $("#no-more-div").show();
                }
            },
            error: function (xhr, status, error) {
                console.error("Error fetching more message threads:", status, error);
            }
        });
    }

    // Function to display message threads in the UI
    function displayMessageThreads(data) {
        var messageThreadContainer = $("#message-thread-container");
        messageThreadContainer.empty(); // Clear existing threads

        data.forEach(function (messageThread) {
            var thread_name = (messageThread.Sender.user_id == <?php echo $_SESSION['userData']['user_id']; ?>) ? messageThread.Receiver.name : messageThread.Sender.name;
            var thread_img = (messageThread.Sender.user_id == <?php echo $_SESSION['userData']['user_id']; ?>) ? messageThread.Receiver.img_url : messageThread.Sender.img_url;
            var sender_name = (messageThread.LatestMessage.sender_id == messageThread.Sender.user_id) ? messageThread.Sender.name : messageThread.Receiver.name;

            var card = `
                <div class="row mt-4 thread-card">
                    <div class="col">
                        <div class="card" style="width: 100%;">
                            <div class="d-flex flex-column h-100">
                                <div class="row no-gutters">
                                    <div class="col-md-2 d-flex align-items-center justify-content-center" style="height: 100px;">
                                        <img src="<?php echo $this->webroot; ?>${thread_img}" alt="Image" class="card-img mt-1" style="width: auto; max-height: 90px; max-width: 90px;">
                                    </div>
                                    <div class="col-md-10">
                                        <div class="card-body">
                                            <p class="card-text font-weight-bold">${thread_name}</p>
                                            <p class="card-text mt-3"><strong>${sender_name} :</strong> ${messageThread.LatestMessage.message_content}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-auto card-footer d-flex justify-content-between align-items-center button-container">
                                    <small class="text-muted">${messageThread.LatestMessage.created}</small>
                                    <button class="view-button btn btn-primary" data-message-thread-id="${messageThread.MessageThread.message_thread_id}">
                                        <i class="fas fa-eye"></i> View
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            `;
            messageThreadContainer.append(card);
        });
    }
    // Call showMoreThreads on "show more" button click
    $("#show-more-div").click(function () {
        showMoreThreads();
    });

});
</script>

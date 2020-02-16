class VettingBox extends React.Component {
    state = { data: this.props.initialData };

    loadQuestionsFromServer = () => {
        var request = new XMLHttpRequest();
        request.open('get', this.props.questionsUrl, true);
        request.onload = function () {
            var result = JSON.parse(request.responseText);
            this.setState({ questions: result });
        }.bind(this);
        request.send();
    }

    handleUserSubmit = user => {
        this.setState({ data: user });

        //alert(JSON.stringify(user));
        var data = new FormData();
        data.append('firstName', user.firstName);
        data.append('lastName', user.lastName);
        data.append('emailAddress', user.emailAddress);

        var request = new XMLHttpRequest();
        request.open('post', this.props.checkUserUrl, true);
        //request.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');
        request.onload = function () {
            var response = JSON.parse(request.responseText);

            if (response === 'PROCEED') {
                this.loadQuestionsFromServer();
            }
            else {

            }
        }.bind(this);
        request.send(data);
    };

    //handleQuestionsSubmit = questions => {
    //    //this.setState({ question: questions });
    //    //var data = new FormData();

    //};

    //componentDidMount() {
    //    window.setInterval(this.loadQuestionsFromServer, this.props.pollInterval);
    //}

    render() {
        return (
            <div className="userForm">
                <UserForm onUserSubmit={this.handleUserSubmit} />
            </div>
        );
    }
}

class UserForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            firstName: '',
            lastName: '',
            emailAddress: ''
        };
    }

    handleSubmit = (e) => {
        e.preventDefault();

        var firstName = this.state.firstName.trim();
        var lastName = this.state.lastName.trim();
        var emailAddress = this.state.emailAddress.trim();
        //alert('A name was submitted: ' + firstName + ' ' + lastName);

        if (!firstName || !lastName || !emailAddress) {
            return;
        }
        this.props.onUserSubmit({ firstName: firstName, lastName: lastName, emailAddress: emailAddress });
    };

    handleUserFirstNameChange = e => {

        this.setState({ firstName: e.target.value });
    };

    handleUserLastNameChange = e => {
        this.setState({ lastName: e.target.value });
    };

    handleUserEmailAddressChange = e => {
        this.setState({ emailAddress: e.target.value });
    };

    render() {
        return (
            <form id="userForm" onSubmit={this.handleSubmit}>
                <div className="card card-5">
                    <div className="card-heading">
                        <h2 className="title">User Vetting</h2>
                    </div>
                    <div className="card-body">
                        <div className="form-row">
                            <div className="name">First Name</div>
                            <div className="value">
                                <div className="form-group input-group">
                                    <input
                                        className="form-control input--style-5"
                                        id="firstName"
                                        type="text"
                                        value={this.state.firstName}
                                        onChange={this.handleUserFirstNameChange}
                                    />
                                </div>
                            </div>
                        </div>

                        <div className="form-row">
                            <div className="name">Last Name</div>
                            <div className="value">
                                <div className="form-group input-group">
                                    <input
                                        className="form-control input--style-5"
                                        id="lastName"
                                        type="text"
                                        value={this.state.astName}
                                        onChange={this.handleUserLastNameChange}
                                    />
                                </div>
                            </div>
                        </div>

                        <div className="form-row">
                            <div className="name">Email Address</div>
                            <div className="value">
                                <div className="form-group input-group">
                                    <input
                                        className="form-control input--style-5"
                                        id="emailAddress"
                                        type="email"
                                        value={this.state.emailAddress}
                                        onChange={this.handleUserEmailAddressChange}
                                    />
                                </div>
                            </div>
                        </div>
                        <input id="btnCheckUser" className="btn btn-primary" type="submit" value="Check User" />
                    </div>
                </div>
            </form>
        );
    }
}

//class QuestionList extends React.Component {
//    render() {
//        var questionNodes = this.prop.data.Questions.map(function (question) {
//            return (
//                //Figure out how to handle the options here
//                <Question key={question.QuestionId}>
//                    {question.QuestionText}
//                </Question>
//            );
//        });
//    }
//}



function createRemarkable() {
    var remarkable =
        'undefined' != typeof global && global.Remarkable
            ? global.Remarkable
            : window.Remarkable;

    return new remarkable();
}

//class UserResult extends React.Component {
//    render() {
//        return (
//            <div>
//            </div>
//        );
//    }
//}

//class Question extends React.Component {
//    render() {
//        return (
//            <div>
//            </div>
//        );
//    }
//}

//class Option extends React.Component {
//    render() {
//        return (
//            <div>
//            </div>
//        );
//    }
//}
/*placeholder="First Name"*/
/*placeholder="Last Name"*/
/*placeholder="Email Address"*/
